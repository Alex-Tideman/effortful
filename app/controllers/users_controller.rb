class UsersController < ApplicationController

  def index

  end

  def create

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