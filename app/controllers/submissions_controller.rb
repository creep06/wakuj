class SubmissionsController < ApplicationController
	protect_from_forgery :except => [:update]
	def index
		@submissions = Submission.paginate(page: params[:page])
	end

	def show
		@submission = Submission.find(params[:id])
		@problem = Problem.find(@submission.problem_id)
		@user = User.find(@submission.user_id)
		@results = Result.where(submission_id: params[:id])
	end

	def create
		@submission = Submission.new(submission_params)
		# コード長を保存しとく
		# TODO
		# 改行が2文字扱いになってるけど後で1文字扱いにしたい
		@submission.length = @submission.code.length

		if @submission.save
			# ユーザーと問題のsubmittedをインクリメント
			user = User.find(@submission.user_id)
			user.update_attribute(:submitted, user.submitted + 1)
			prob = Problem.find(@submission.problem_id)
			prob.update_attribute(:submitted_count, prob.submitted_count+1)
			# sidekiqのキューにidを追加してジャッジを待つ
			JudgeWorker.perform_async(@submission.id)
			# リダイレクト
			flash[:success] = "ジャッジ終了までお待ち下さい"
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
