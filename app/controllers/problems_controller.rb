class ProblemsController < ApplicationController
	def index
		@problems = Problem.paginate(page: params[:page])
	end

	def show
		@problem = Problem.find(params[:id])
		@submission = Submission.new
	end
end
