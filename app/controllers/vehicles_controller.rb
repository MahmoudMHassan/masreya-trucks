class VehiclesController < ApplicationController
  def new
    @vehicle = Vehicle.new
    @vehicle.heavytruck = Heavytruck.new
  end

  def edit
  end

  def create
    #@vehicle = Vehicle.new(params.require(:vehicle).permit(:make, :model, :manyear, :country, :axles, :gearbox,:colour, :price, heavytruck_attributes:  [:id,:capacity, :mileage]))
    @vehicle = Vehicle.new(params.require(:vehicle).permit(:make, :model, :manyear, :country, :axles, :gearbox,:colour, :price))
    #     @heavytruck = Heavytruck.new(params.require(:heavytruck).permit(:capacity, :mileage))
    #     @vehicle.heavytruck = heavytruck_attributes.map{|h| Heavytruck.new(h)}
    @vehicle.save
  end
end 
