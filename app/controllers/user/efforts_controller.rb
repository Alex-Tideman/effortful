class User::EffortsController < ApplicationController

  def index
  end

  def show
    @effort = Effort.find(params[:id])
  end

  def new
    @effort = Effort.new
  end

  def create
    @effort = Effort.new(effort_params)
    @effort.update(member_id: current_user.id)
    if @effort.save
      @effort.votes.create
      current_user.efforts << @effort
      flash[:success] = "#{@effort.title} has been created!"
      redirect_to user_effort_path(id: @effort.id, user: current_user)
    else
      render :new
    end

  end

  def edit
    @effort = Effort.find(params[:id])
  end

  def update
    @effort = Effort.find(params[:id])

    if current_sponsor
     current_user.efforts << @effort
    elsif current_volunteer
      @effort.update(volunteer_id: current_user.id)
      current_user.efforts << @effort
    end

    redirect_to user_effort_path(id: @effort.id, user: @effort.member)

  end

  private

  def effort_params
    params.require(:effort).permit(:title,:description,:requested_reward,:length,:location)
  end

end
