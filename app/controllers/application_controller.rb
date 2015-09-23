class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :current_member, :current_volunteer, :current_sponsor

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_member
    current_user if current_user.role == "Member"
  end

  def current_volunteer
    current_user if current_user.role == "Volunteer"
  end

  def current_sponsor
    current_user if current_user.role == "Sponsor"
  end

  def authorize!
    redirect_to root_path unless current_user
  end

end
