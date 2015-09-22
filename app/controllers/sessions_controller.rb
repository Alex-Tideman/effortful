class SessionsController < ApplicationController

  def new
  end

  def create
    if params[:session].nil?
      user = User.find_or_create_from_auth(oauth_data)
      if user
        session[:user_id] = user.id
        flash[:notice] = "Welcome back to Effortful,  #{user.name}!"
        redirect_to root_path
      end
    else
      user = User.find_by(email: params[:session][:email])
      if user && user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        flash[:success] = "Welcome back to Collector's World, #{user.first_name}" \
        " #{user.last_name}!"
        redirect_to root_path
      else
        flash[:warning] = "Unable to Login with this Email and" \
        " Password combination."
        render :new
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def oauth_data
    request.env['omniauth.auth']
  end
end