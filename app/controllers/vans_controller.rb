class VansController < ApplicationController
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
       @vehicle.van = Van.new(vehicle_id: @vehicle.id,capacity: params[:capacity],mileage: params[:mileage])
    @vehicle.save
redirect_to root_path
  end
end
