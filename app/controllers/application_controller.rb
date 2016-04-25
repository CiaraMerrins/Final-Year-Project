class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  include ApplicationHelper
  
  def coachauthorise
	unless coachsigned_in?
		store_location
		redirect_to coachsignin_path, :notice=> "Coach, please sign in to access this page"
	end
  end
  
  def playerauthorise
	unless playersigned_in?
		store_location
		redirect_to playersignin_path, :notice=> "Player, please sign in to access this page"
	end
  end
  
  private
  def store_location
	session[:return_to] = request.fullpath
  end
  
  
end
