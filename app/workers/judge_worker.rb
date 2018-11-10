class JudgeWorker
	include Sidekiq::Worker

	def perform(id)
		@sub = Submission.find(id)
		
	end
end
