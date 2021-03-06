class ResultsController < ApplicationController
	protect_from_forgery :except => [:create]
	def create
		@result = Result.new(result_params)
		if @result.save
			logger.debug("save成功")
		else
			logger.debug("save失敗")
			logger.debug(@result.errors.full_messages)
		end
	end

	private

		def result_params
			params.permit(:name, :verdict, :time, :memory, :submission_id)
		end

end
