class ApplicationController < ActionController::Base

  def mcdb_user
    current_user
  end
  helper_method :mcdb_user

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
