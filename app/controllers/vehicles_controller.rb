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
  
# 
# def find_vehicable
#   params.each do |name, value|
#     if name =~ /(.+)_id$/
#       return $1.classify.constantize.find(value)
#     end
#   end
# end
