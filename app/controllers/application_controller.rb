class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  	def current_user
  		if session[:user_id]
  		    @current_user = User.find(session[:user_id])
  		end
  	end

  	def logged_in?
  		current_user != nil
  	end

  	helper_method :current_user, :logged_in?

end
