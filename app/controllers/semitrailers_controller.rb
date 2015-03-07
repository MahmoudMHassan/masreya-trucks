class SemitrailersController < ApplicationController
  def index
    @semitrailers = Semitrailer.all
  end

  def new
    @vehicle = Vehicle.new
    @semitrailer=Semitrailer.new
  end

  def create
    @vehicle = Vehicle.new(params.require(:vehicle).permit(:make, :model, :manyear, :country, :axles, :gearbox,:colour, :price))
    @vehicle.save
    @semitrailer = Semitrailer.new(id: @vehicle.id)
    @semitrailer.save


  end

  def show
  end

  def delete
  end

  def destroy
  end

  def edit
  end

  def update
  end
end
