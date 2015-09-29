class User::EffortsController < ApplicationController
  respond_to :json

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
      @effort.vote = Vote.new
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

    if current_volunteer && @effort.sponsors.count == 7
      @effort.update(volunteer_id: current_user.id)
      current_volunteer.efforts << @effort
      @effort.schedule = Schedule.new
    elsif current_volunteer
      @effort.update(volunteer_id: current_user.id)
      current_volunteer.efforts << @effort
    elsif current_sponsor
      current_sponsor.efforts << @effort
    end

    redirect_to user_effort_path(id: @effort.id, user: @effort.member)

  end

  private

  def effort_params
    params.require(:effort).permit(:title,:description,:requested_reward,:length,:ne_lat,:ne_lng,:sw_lat,:sw_lng)
  end

end
