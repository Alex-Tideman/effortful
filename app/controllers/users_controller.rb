class UsersController < ApplicationController

  def show
    @user = current_user
    sponsor_count = @user.sponsor_count
    w3w_location = what3words.words_to_position @user.w3w_split
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    if @user.save
      flash[:success] = "Your profile has been updated."
      redirect_to profile_path
    else
      flash[:error] = "There are some errors in your profile. Please fix."
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:mission, :hobby, :location, :role)
  end

end