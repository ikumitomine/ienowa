class ApplicationController < ActionController::Base
	#signin後のリダイレクト先
	def after_sign_in_path_for(resource)
		root_path
	end
end
