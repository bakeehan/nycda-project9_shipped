class BoatsController < ApplicationController
  def index
    @boats = Boat.all
  end

  def new
    @boat = Boat.new
  end

  def create
    @boat = Boat.new(boat_params)
      if boat.save
        redirect_to "/boats"
      else
        render "/boats/new"
      end
  end

  def show

  end

  def destroy

  end

  private

  def boat_params
    params.require(:boat).permit(:name, :containers, :location)
end
end
