class ProblemsController < ApplicationController
	def index
		@problems = Problem.page(params[:page]).per(20)
	end

	def show
		@problem = Problem.find(params[:id])
		@submission = Submission.new
	end
end
