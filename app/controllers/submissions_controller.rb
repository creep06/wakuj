class SubmissionsController < ApplicationController
	def index
	end

	def show
		@submission = Submission.find(params[:id])
	end

	def create
		@submission = Submission.new(submission_params)
		# コード長を保存しとく
		# 改行が2文字扱いになってるけど後で1文字扱いにしたい
		@submission.length = @submission.code.length

		if @submission.save
			# sidekiqのキューにidを追加してジャッジを待つ
			JudgeWorker.perform_async(@submission.id)
			flash[:success] = "ジャッジ終了までお待ち下さい"
			redirect_to @submission
		else
			flash[:danger] = @submission.errors.full_messages
			redirect_to Problem.find(@submission.problem_id)
		end
	end

	private

		def submission_params
			params.require(:submission).permit(:code, :language, :user_id, :problem_id)
		end
end
