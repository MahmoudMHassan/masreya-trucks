class MakesController < ApplicationController
  def new
    @make = Make.new
    @make.ad = Ad.new
    @make.vehicle = Vehicle.new
 
  end
  
   def create
    @make = Make.new(params.require(:make).permit(:purchase, :new, :imported, ad_attributes: [:id, :title, :description], vehicle_attributes: [:id, :make, :model, :manyear, :country, :axles, :gearbox, :colour, :price])
    @make.save
    redirect_to '/ads/home'
  end


  def edit
  end

  def show
  end

  def update
  end

  def delete
  end

  def destroy
  end

  def index
  end

 
end
