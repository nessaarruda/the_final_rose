class Bachelorette::ContestantsController < ApplicationController

  def index
    @bachelorette = Bachelorette.find(params[:bachelorette_id])
    @contestants = @bachelorette.contestants
  end

  def show

  end
end
