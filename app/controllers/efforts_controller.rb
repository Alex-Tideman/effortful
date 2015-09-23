class EffortsController < ApplicationController

  def index
    @efforts = Effort.all
  end
end