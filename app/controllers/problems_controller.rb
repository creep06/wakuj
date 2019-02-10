class ProblemsController < ApplicationController
	def index
		@problems = Problem.page(params[:page]).per(20)
	end

	def show
		@problem = Problem.find(params[:id])
		@submission = Submission.new
	end

	# アルファベット順にソートした問題名一覧を返す
	def getnames
		problems = Problem.all
		data = []
		problems.each{|p|
			data.push(p.name)
		}
		result = []
		data.sort.each{|n|
			result.push({
				'id': n,
				'text': n
			})
		}
		render json: result
	end
end
