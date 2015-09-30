class SessionsController < ApplicationController

  def new
  end

  def create
      user = User.find_or_create_from_auth(oauth_data)
      if user
        session[:user_id] = user.id
        flash[:success] = "Welcome back to Effortful,  #{user.name}!"
        redirect_to profile_path
      end
    end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Hope to see you soon!"
    redirect_to root_path
  end

  private

  def oauth_data
    request.env['omniauth.auth']
  end
end