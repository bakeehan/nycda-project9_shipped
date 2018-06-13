class BoatsController < ApplicationController
  def index
    @boats = Boat.all
  end

  def new
    @boat = Boat.new
  end

  def create
    @boat = Boat.new(boat_params)
      if @boat.save
        flash[:notice] = "Boat created successfully."
        redirect_to "/boats"
      else
        render "/boats/new"
      end
  end

  def show
      @boat = Boat.find(params[:id])
  end

  def edit
    @boat = Boat.find(params[:id])
  end

  def update
    @boat = Boat.find(params[:id])
    if @boat.update(boat_params)
      redirect_to "/boats"
    else
      render "/boats/#{:id}"
    end
  end

  def destroy
    boat = Boat.find(params[:id])
    boat.destroy
    redirect_to "/boats/"
  end

  private

  def boat_params
    params.require(:boat).permit(:name, :containers, :location)
end
end

# flash[:notice] = "Boat created successfully."
