class AdsController < ApplicationController
  def new
  end
   def home
     @ads = Ad.all.order('created_at DESC').first(7)
  end
  def show
    @ad = Ad.find(params[:id]) if Ad.exists?(params[:id])
    @make = Make.find_by_ad_id(params[:id])
    @vehicle = Vehicle.find(Make.find_by_ad_id(params[:id]).vehicle_id)
    @seller = User.find(Make.find_by_ad_id(params[:id]).user_id)
    @van = Van.find_by_vehicle_id(@vehicle.id)
    @semitrailer = Semitrailer.find_by_vehicle_id(@vehicle.id)
    @semitrailertruck = Semitrailertruck.find_by_vehicle_id(@vehicle.id)
    @heavytruck = Heavytruck.find_by_vehicle_id(@vehicle.id)
  end
  def bookmark
    @bookmark = Bookmark.new(user_id: self.current_user.id, ad_id: params[:id])
    @bookmark.save
    redirect_to "/ads/#{params[:id]}"
  end
  def  unbookmark
    Bookmark.where(:user_id => self.current_user.id,:ad_id => params[:id]).destroy_all
    redirect_to "/ads/#{params[:id]}"
  end
  def delete
    Make.destroy_all(user_id: self.current_user.id, ad_id: params[:id])
    Bookmark.destroy_all(ad_id: params[:id])
    Ad.destroy(params[:id])
    redirect_to root_path
  end
  def edit
   @ad = Ad.find(params[:id]) if Ad.exists?(params[:id])
   @make = Make.find_by_ad_id(params[:id])
    @vehicle = Vehicle.find(Make.find_by_ad_id(params[:id]).vehicle_id)
    @seller = User.find(Make.find_by_ad_id(params[:id]).user_id)
    @van = Van.find_by_vehicle_id(@vehicle.id)
    @semitrailer = Semitrailer.find_by_vehicle_id(@vehicle.id)
    @semitrailertruck = Semitrailertruck.find_by_vehicle_id(@vehicle.id)
    @heavytruck = Heavytruck.find_by_vehicle_id(@vehicle.id)
  end
  def update
    @ad = Ad.find(params[:id]) if Ad.exists?(params[:id])
   @make = Make.find_by_ad_id(params[:id])
    @vehicle = Vehicle.find(Make.find_by_ad_id(params[:id]).vehicle_id)
    @seller = User.find(Make.find_by_ad_id(params[:id]).user_id)
    @van = Van.find_by_vehicle_id(@vehicle.id)
    @semitrailer = Semitrailer.find_by_vehicle_id(@vehicle.id)
    @semitrailertruck = Semitrailertruck.find_by_vehicle_id(@vehicle.id)
    @heavytruck = Heavytruck.find_by_vehicle_id(@vehicle.id)

    @vehicle.update(make: params[:make], model: params[:model], manyear: params[:manyear], country: params[:country], axles: params[:axles], gearbox: params[:gearbox], colour: params[:colour], price: params[:price])
    if @van !=nil
       @vehicle.van.update(vehicle_id: @vehicle.id,capacity: params[:capacity],mileage: params[:mileage])
    elsif @semitrailer!=nil
       @vehicle.semitrailer.update(vehicle_id: @vehicle.id,capacity: params[:capacity])
    elsif @semitrailertruck !=nil
       @vehicle.semitrailertruck.update(vehicle_id: @vehicle.id,type: params[:type],mileage: params[:mileage])
    elsif @heavytruck !=nil
       @vehicle.heavytruck.update(vehicle_id: @vehicle.id,capacity: params[:capacity],mileage: params[:mileage])
    end
    @vehicle.save
    @ad.update(title: params[:title], description: params[:description])
    @ad.save
    @make.update(new: params[:new],imported: params[:imported],purchase: params[:purchase])
    @make.save
    #connect = ActiveRecord::Base.connection();
    #connect.execute(ActiveRecord::Base.send(:sanitize_sql_array, ["Update makes SET new = %s, purchase = %s, imported =%s WHERE ad_id =%s",params[:new],params[:purchase],params[:imported],@ad.id]))
     #sql ="Update makes SET new = #{params[:new]}, purchase = #{params[:purchase]}, imported =  #{params[:imported]} WHERE ad_id = #{@ad.id}"
     # ActiveRecord::Base.connection.execute(sql)
redirect_to "/ads/#{@ad.id}"
  end


end
