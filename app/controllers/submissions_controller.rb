class SubmissionsController < ApplicationController
	protect_from_forgery :except => [:update]

	def index
		@submissions = Kaminari.paginate_array(Submission.all.reverse).page(params[:page]).per(20)
	end

	def show
		@submission = Submission.find(params[:id])
		@problem = Problem.find(@submission.problem_id)
		@user = User.find(@submission.user_id)
		@results = Result.where(submission_id: params[:id])
	end

	# resultのリアルタイム表示用
	def renew
		results = Result.where(submission_id: params[:id])
		render json: results
	end

	# submissionの更新用
	def srenew
		submission = Submission.find(params[:id])
		render json: submission
	end

	# 全submissionのデータを表示用に整形してからjsonで返す
	def getall
		submissions = Submission.all
		data = []
		submissions.each{|s|
			data.push({
				'submission_id': s.id,
				'created_at': view_context.simple_time(s.created_at),
				'problem_id': s.problem_id,
				'problem_name': Problem.find(s.problem_id).name,
				'user_id': s.user_id,
				'user_name': User.find(s.user_id).name,
				'verdict': s.verdict,
				'verdict_image_path': (s.verdict=='Pending' ? '/images/Pending.gif' : "/images/#{s.verdict}.png"),
				'point': (s.verdict=='Pending' ? 0 : s.point),
				'language': view_context.language_name_s(s.language),
				'time': (s.verdict=='Pending' || s.verdict=='CE' ? '-' : s.time.to_s + ' ms'),
				'memory': (s.verdict=='Pending' || s.verdict=='CE' ? '-' : s.memory.to_s + ' KB'),
				'length': s.length
			})
		}
		render json: data
	end

	def create
		@submission = Submission.new(submission_params)
		# コード長を保存しとく
		@submission.length = @submission.code.length - @submission.code.count("\n")

		if @submission.save
			# ユーザーと問題のsubmittedをインクリメント
			user = User.find(@submission.user_id)
			user.update_attribute(:submitted, user.submitted + 1)
			prob = Problem.find(@submission.problem_id)
			prob.update_attribute(:submitted_count, prob.submitted_count+1)
			# sidekiqのキューにidを追加してジャッジを待つ
			JudgeWorker.perform_async(@submission.id)
			# リダイレクト
			redirect_to @submission
		else
			flash[:danger] = @submission.errors.full_messages
			redirect_to prob
		end
	end

	def update
		sub = Submission.find(params[:submission_id])
		pro = Problem.find(sub.problem_id)
		user = User.find(sub.user_id)
		if params[:verdict] == "CE"
			sub.verdict = "CE"
			sub.time = 0
			sub.memory = 0
		else
			sub.verdict = params[:verdict]
			sub.time = params[:time].to_i
			sub.memory = params[:memory].to_i
		end

		sub.point = 0
		if sub.verdict == "AC"
			sub.point = pro.point
			pro.update_attribute(:ac_count, pro.ac_count + 1)
			ex = Accepted.exists?(user_id: user.id, problem_id: pro.id)
			if ex == false
				accepted = Accepted.new(user_id: user.id, problem_id: pro.id)
				if accepted.save
					user.update_attributes(point: user.point + pro.point,
										   solved: user.solved + 1)
					pro.update_attribute(:solved_count, pro.solved_count + 1)
				else
					logger.debug(accepted.errors.full_messages)
				end
			end
		end

		sub.save
	end

	private

		def submission_params
			params.require(:submission).permit(:code, :language, :user_id, :problem_id)
		end
end
