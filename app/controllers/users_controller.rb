class UsersController < ApplicationController
	def check
		@user = User.find(current_user.id)
	end

	def withdraw
		@user = User.find(current_user.id)
		@user.update(is_active: false)
		reset_session
		redirect_to root_path
	end

	private
	def user_params
		params.require(:user).permit(:is_active)
	end
end
