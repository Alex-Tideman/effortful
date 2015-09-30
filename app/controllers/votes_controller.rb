class VotesController < ApplicationController
  respond_to :json

  def update
    user = User.find(params[:vote][:user_id])
    vote = Vote.find(params[:vote][:id])
    new_yes_count = vote.yes + 1
    new_no_count = vote.no + 1

    if params[:vote][:type]  == "yes"
      respond_with vote.update_attributes(yes: new_yes_count)
    elsif params[:vote][:type]  == "no"
      respond_with vote.update_attributes(no: new_no_count)
    end

    user.votes << vote
    flash[:success] = "You voted!"


  end

  private

  def vote_params
    params.require(:vote).permit(:id, :yes, :no)
  end

end