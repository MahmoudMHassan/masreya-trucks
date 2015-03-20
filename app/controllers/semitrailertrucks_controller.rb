class SemitrailertrucksController < ApplicationController
  def new
    if self.current_user==nil || !Seller.exists?(self.current_user.id)
      redirect_to root_path
      return
    end
    @vehicle = Vehicle.new
    
  end
  

  def create
    @vehicle = Vehicle.new(make: params[:make], model: params[:model], manyear: params[:manyear], country: params[:country], axles: params[:axles], gearbox: params[:gearbox], colour: params[:colour], price: params[:price])
    #@vehicle = Vehicle.new(params.require(:vehicle).permit(:make, :model, :manyear, :country, :axles, :gearbox,:colour, :price))
    @vehicle.semitrailertruck = Semitrailertruck.new(vehicle_id: @vehicle.id,type: params[:type],mileage: params[:mileage])
    @vehicle.save
    redirect_to root_path
  end

  def edit
    @semitrailertruck = Semitrailertrucks.find(params[:id])
    # @embed = Embed.find(params[:postid])
  end
  

  def update
  end

  def show
    if Semitrailertruck.exists?(params[:id])
      @semitrailertruck = Semitrailertruck.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def index
    @semitrailertruck= Semitrailertruck.all
  end

  def delete
    Semitrailertruck.destroy(params[:id])
    Mileage.where(pid: params[:id]).destroy_all
    flash.keep
    redirect_to root_path
  end
  
  def destroy
  end
end
