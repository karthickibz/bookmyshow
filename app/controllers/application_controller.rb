class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  private
	def sign_up_params
		params.require(:user).permit(:username, :attachment, :email, :password, :password_confirmation)
	end

	def account_update_params
		params.require(:user).permit( :username, :attachment, :email, :password, :password_confirmation, :current_password)
	end
end
