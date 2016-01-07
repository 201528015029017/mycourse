class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def sessionOrNot
    if session[:user].nil?
      return 0
    else
      return session[:user]["id"]
    end
  end
end
