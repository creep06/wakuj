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

	def getall
		problems = Problem.all
		data = []
		problems.each{|p|
			data.push({
				'problem_id': p.id,
				'problem_name': p.name,
				'point': p.point,
				'solved_count': p.solved_count,
				'success_rate': (p.ac_count*100 / [p.submitted_count, 1].max).to_s + ' %'
			})
		}
		render json: data
	end
end
