class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

	def hello
		render html: "SAY HELLO TO MY LITTLE FRIENDS"
	end
end
