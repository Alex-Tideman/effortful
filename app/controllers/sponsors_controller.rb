class SponsorsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to Effortful, #{@user.name}!"
      redirect_to root_path
    else
      flash.now[:warning] = @user.errors.full_messages.join(". ")
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end