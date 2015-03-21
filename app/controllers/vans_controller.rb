class VansController < ApplicationController
    def new
        if self.current_user==nil || !Seller.exists?(self.current_user.id)
	  redirect_to root_path
	  return
	end
    @vehicle = Vehicle.new
	
  end

  def create
    @blank = false
    if params[:title] == "" || params[:description] == ""
      @blank = true
      render 'new'
      return
    end
   @vehicle = Vehicle.new(make: params[:make], model: params[:model], manyear: params[:manyear], country: params[:country], axles: params[:axles], gearbox: params[:gearbox], colour: params[:colour], price: params[:price])
       @vehicle.van = Van.new(vehicle_id: @vehicle.id,capacity: params[:capacity],mileage: params[:mileage])
    @vehicle.save
    @ad = Ad.new(title: params[:title], description: params[:description])
    @ad.save
    @make = Make.new(user_id: self.current_user.id,vehicle_id: @vehicle.id,ad_id: @ad.id,new: params[:new],purchase: params[:purchase], imported: params[:imported])
    @make.save
redirect_to "/ads/#{@ad.id}"
  end
end
