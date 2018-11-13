class ProblemsController < ApplicationController
	def index
		@problems = Problem.paginate(page: params[:page], per_page: 20)
	end

	def show
		@problem = Problem.find(params[:id])
		@submission = Submission.new
	end
end
