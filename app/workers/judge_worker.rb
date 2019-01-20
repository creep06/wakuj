require 'net/http'

class JudgeWorker
	include Sidekiq::Worker

	def perform(id)
		sub = Submission.find(id)
		pro = Problem.find(sub.problem_id)
		user = User.find(sub.user_id)

		if Rails.env == "development"
			uri = URI.parse("http://localhost:3001/judge")
		else
			uri = URI.parse("http://wakuwaku-judge-api.us-east-2.elasticbeanstalk.com/judge")
		end
		http = Net::HTTP.new(uri.host, uri.port)
		http.use_ssl = false
		http.verify_mode = OpenSSL::SSL::VERIFY_NONE
		req = Net::HTTP::Post.new(uri.path)
		req.set_form_data({
			code: sub.code,
			language: sub.language,
			time_limit: pro.time_limit,
			memory_limit: pro.memory_limit,
			testcases_number: pro.testcases_count,
			submission_id: id,
			problem_id: pro.id
		})

		http.request(req)

	end
end
