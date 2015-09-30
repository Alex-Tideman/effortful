class EffortsController < ApplicationController

  def index
    efforts = Effort.all
    @pending_efforts = efforts.map do |effort|
      effort if effort.schedule.nil?
    end.compact

    @food_efforts = @pending_efforts.map do |effort|
      effort if effort.requested_reward == "Food"
    end.compact

    @clothing_efforts = @pending_efforts.map do |effort|
      effort if effort.requested_reward == "Clothing"
    end.compact

    @job_efforts = @pending_efforts.map do |effort|
      effort if effort.requested_reward == "Job Resources"
    end.compact
  end
end