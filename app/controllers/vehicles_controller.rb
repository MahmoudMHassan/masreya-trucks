class VehiclesController < ApplicationController
  def new
    @vehicle = Vehicle.new
  end

  def create

    @vehicle = Vehicle.new(params.require(:vehicle).permit(:make, :model, :manyear, :country, :axles, :gearbox,:colour, :price, heavytruck_attributes: [:id,:capacity, :mileage]))
  @vehicle.save
  end

  def edit
  end

  def delete
  end

  def destroy
  end

  def update
  end

  def index
  end

  def show
  end
end
