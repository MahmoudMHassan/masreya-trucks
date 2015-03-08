class HeavytrucksController < ApplicationController
  def new
    @vehicle = Vehicle.new
    @heavytruck=Heavytruck.new
    
  end

  def create
    @vehicle = Vehicle.new(params.require(:vehicle).permit(:make, :model, :manyear, :country, :axles, :gearbox,:colour, :price))
    @vehicle.save
    @semitrailer = Semitrailer.new(params.require(:vehicle).permit(:capacity))
    @semitrailer.id = @vehicle.id
    @semitrailer.save
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
