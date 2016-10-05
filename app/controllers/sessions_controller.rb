class SessionsController < ApplicationController

	def create
		user = User.
		session[:user_id] = user.id
		redirect_to root_path, notice: 'ログインしました'
	end

	def destroy
		reset_session
		redirect_to root_path, notice: 'ログアウトしました'
	end

end
