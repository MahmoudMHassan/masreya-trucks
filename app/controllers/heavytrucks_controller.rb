class HeavytrucksController < ApplicationController
  def new
    @vehicle = Vehicle.new
   @vehicle.heavytruck = Heavytruck.new
  end

  def create
    @vehicle = Vehicle.new(params.require(:vehicle).permit(:make, :model, :manyear, :country, :axles, :gearbox,:colour, :price, heavytruck_attributes:  [:id,:capacity, :mileage]))
#     @heavytruck = Heavytruck.new(params.require(:heavytruck).permit(:capacity, :mileage))
#     @vehicle.heavytruck = heavytruck_attributes.map{|h| Heavytruck.new(h)}
    @vehicle.save
#     @heavytruck.id = @vehicle.id
#     @heavytruck.save

  end

  def edit
  end

  def update
  end

  def delete
  end

  def destroy
  end

  def show
  end

  def index
    @heavytrucks=Heavytruck.all
  end
end
