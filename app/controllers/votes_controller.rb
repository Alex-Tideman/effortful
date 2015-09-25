class VotesController < ApplicationController
  respond_to :json

  def update
    vote = Vote.find(params[:vote][:id])
    new_yes_count = vote.yes + 1
    new_no_count = vote.no + 1

    if params[:vote][:type]  == "yes"
      respond_with vote.update(yes: new_yes_count)
    elsif params[:vote][:type]  == "no"
      respond_with vote.update(no: new_no_count)
    end

  end

  private

  def vote_params
    params.require(:vote).permit(:id, :yes, :no)
  end

end