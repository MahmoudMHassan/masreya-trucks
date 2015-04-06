class AdsController < ApplicationController
  def new
    @ad = Ad.new
    @vehicle = Vehicle.new
    @make = Make.new
    @van = Van.new
    @heavytruck = Heavytruck.new
    @semitrailer = Semitrailer.new
    @semitrailertruck = Semitrailertruck.new
  end
  private def ad_params
  ad_params = params.require(:ad).permit(:title,:description)
  ad_params
  end

  private def vehicle_params
  vehicle_params = params.require(:vehicle).permit(:make,:model,:manyear,:country,:axles,:gearbox,:colour,:price)
  vehicle_params
  end
  
  private def make_params
  make_params = params[:make].permit(:new,:imported,:purchase)
  make_params
  end
  
  private def van_params
  van_params = params[:van].permit(:capacity,:mileage)
  van_params
  end
  
  private def heavytruck_params
  heavytruck_params = params[:heavytruck].permit(:capacity,:mileage)
  heavytruck_params
  end
  
  private def semitrailer_params
  semitrailer_params = params[:semitrailer].permit(:capacity)
  semitrailer_params
  end
  
  private def semitrailertruck_params
  semitrailertruck_params = params[:semitrailertruck].permit(:mileage)
  semitrailertruck_params
  end
  def create
    @ad = Ad.new(ad_params)
    @ad.save
    @vehicle = Vehicle.new(vehicle_params)
    @vehicle.save
    @make = Make.new(user_id: self.current_user.id,vehicle_id: @vehicle.id,ad_id: @ad.id)
    @make.update(make_params)
    @make.save
    if params[:van]
      @van = Van.new(vehicle_id: @vehicle.id)
      @van.update(van_params)
      @van.save
    elsif params[:heavytruck]
      @heavytruck = Heavytruck.new(vehicle_id: @vehicle.id)
      @heavytruck.update(heavytruck_params)
      @heavytruck.save
    elsif params[:semitrailer]
      @semitrailer = Semitrailer.new(vehicle_id: @vehicle.id)
      @semitrailer.update(semitrailer_params)
      @semitrailer.save
    elsif params[:semitrailertruck]
      @semitrailertruck = Semitrailertruck.new(vehicle_id: @vehicle.id)
      @semitrailertruck.update(semitrailertruck_params)
      @semitrailertruck.save
    end
    redirect_to "/ads/#{@ad.id}"
  end
  def home
    @ads = Ad.first(10)
  end
  
  def search
    @ads = Ad.search(params[:sort],params[:make],params[:model],params[:manyear],params[:country],params[:axles],params[:gearbox],params[:colour],params[:price])
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
  def unbookmark
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
