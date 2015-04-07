class VehiclesController < ApplicationController
  def new
    @vehicle = Vehicle.new
    @vehicle.heavytruck = Heavytruck.new
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
  @vehicable = find_vehicable
  @vehicles = @vehicable.vehicles
end

  def show
  end
end