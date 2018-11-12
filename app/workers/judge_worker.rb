require 'net/http'

class JudgeWorker
	include Sidekiq::Worker

	def perform(id)
		@sub = Submission.find(id)
		uri = URI.parse("http://localhost:3001/judge")
		http = Net::HTTP.new(uri.host, uri.port)
		http.use_ssl = false
		http.verify_mode = OpenSSL::SSL::VERIFY_NONE
		req = Net::HTTP::Post.new(uri.path)
		req.set_form_data({code: @sub.code, language: @sub.language, user_id: @sub.user_id, problem_id: @sub.problem_id})

		# 応答を受け取った = ジャッジ終了
		res = http.request(req)
	end
end
