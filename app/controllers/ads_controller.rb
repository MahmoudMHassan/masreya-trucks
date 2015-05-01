class AdsController < ApplicationController
 before_filter :authorize, :except => [:home, :search,:search_make, :show,:vansearch,:sttsearch]
  def authorize
    if self.current_user != nil
      true
    else
      redirect_to root_path
    end
  end

  def home
    @ads = Make.joins(:ad,:vehicle).limit(10).order('created_at DESC')
  end

  def new
    @ad = Ad.new
    @vehicle = Vehicle.new
    @make = Make.new
    @van = Van.new
    @heavytruck = Heavytruck.new
    @semitrailer = Semitrailer.new
    @semitrailertruck = Semitrailertruck.new
  
  end

  def create
    @ad = Ad.new(ad_params)
    @vehicle = Vehicle.new(vehicle_params)
    @vehicle.save
    #subclassvalid check if params of subclasses are valid
    subclassvalid = false
    if params[:van]
      @van = Van.new(vehicle_id: @vehicle.id)
      @van.assign_attributes(van_params)
      subclassvalid = true if @van.valid?
    elsif params[:heavytruck]
      @heavytruck = Heavytruck.new(vehicle_id: @vehicle.id)
      @heavytruck.assign_attributes(heavytruck_params)
      subclassvalid = true if @heavytruck.valid?
    elsif params[:semitrailer]
      @semitrailer = Semitrailer.new(vehicle_id: @vehicle.id)
      @semitrailer.assign_attributes(semitrailer_params)
      subclassvalid = true if @semitrailer.valid?
    elsif params[:semitrailertruck]
      @semitrailertruck = Semitrailertruck.new(vehicle_id: @vehicle.id)
      @semitrailertruck.assign_attributes(semitrailertruck_params)
      subclassvalid = true if @semitrailertruck.valid?
    end
    #check if ad, vehicle and subclass params are all valid before saving
    if ((@ad.valid?) & (@vehicle.valid?) & (subclassvalid))
      @ad.save
       if @ad.save
	 unless params[:pictures].nil?
       params[:pictures]['image'].each do |a|
          @pictures = @ad.pictures.create!(:image => a, :ad_id => @ad.id)

       end
	 end
	
      @make = Make.new(user_id: self.current_user.id,vehicle_id: @vehicle.id,ad_id: @ad.id)
      @make.update(make_params)
      @make.save
      
      if params[:van]
	@van.save
      elsif params[:heavytruck]
	@heavytruck.save
      elsif params[:semitrailer]
	@semitrailer.save
      elsif params[:semitrailertruck]
	@semitrailertruck.save
      end
      
      redirect_to "/ads/#{@ad.id}"
    else
      #delete saved record of vehicle and display error message
      @vehicle.destroy
      flash.now[:error] = "*خطأ فى إضافة اﻹعلان"
      render 'new'
    end
  end
  end
  def search
    @ads = Ad.search(params[:sort],params[:make],params[:model],params[:manyear],params[:country],params[:axles],params[:gearbox],params[:colour],params[:price],params[:capacity],params[:mileage],params[:type],params[:new],params[:imported],params[:purchase])
  end




  def show
    @ad = Ad.find(params[:id]) if Ad.exists?(params[:id])
    @make = Make.find_by_ad_id(params[:id])
    @vehicle = Vehicle.find(@make.vehicle_id)
    @seller = User.find(@make.user_id)
    @van = Van.find_by_vehicle_id(@vehicle.id)
    @semitrailer = Semitrailer.find_by_vehicle_id(@vehicle.id)
    @semitrailertruck = Semitrailertruck.find_by_vehicle_id(@vehicle.id)
    @heavytruck = Heavytruck.find_by_vehicle_id(@vehicle.id)
    @pictures = @ad.pictures.all
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
    @vehicle = Vehicle.find(@make.vehicle_id)
    @seller = self.current_user
    @van = Van.find_by_vehicle_id(@vehicle.id)
    @semitrailer = Semitrailer.find_by_vehicle_id(@vehicle.id)
    @semitrailertruck = Semitrailertruck.find_by_vehicle_id(@vehicle.id)
    @heavytruck = Heavytruck.find_by_vehicle_id(@vehicle.id)
    #@pictures = @ad.pictures
  end

  def update
    @ad = Ad.find(params[:id]) if Ad.exists?(params[:id])
    @make = Make.find_by_ad_id(params[:id])
    @vehicle = Vehicle.find(@make.vehicle_id)
    @seller = self.current_user
    @van = Van.find_by_vehicle_id(@vehicle.id)
    @semitrailer = Semitrailer.find_by_vehicle_id(@vehicle.id)
    @semitrailertruck = Semitrailertruck.find_by_vehicle_id(@vehicle.id)
    @heavytruck = Heavytruck.find_by_vehicle_id(@vehicle.id)
    
    subclassvalid = false
    @vehicle.assign_attributes(vehicle_params)
    if @van !=nil
      subclassvalid = true if @van.update(van_params)
    elsif @semitrailer!=nil
      subclassvalid = true if @semitrailer.update(semitrailer_params)
    elsif @semitrailertruck !=nil
      subclassvalid = true if @semitrailertruck.update(semitrailertruck_params)
    elsif @heavytruck !=nil
      subclassvalid = true if @heavytruck.update(heavytruck_params)
    end
    
    @ad.assign_attributes(ad_params)
    
    if @ad.valid? & @vehicle.valid? & subclassvalid
      @ad.save
      if @ad.save
	    if @ad.update(ad_params)
          unless params[:pictures].nil?
            params[:pictures]['image'].each do |k|
              @picture = @ad.pictures.create!(:image => k, :ad_id => @ad.id)
            end
	  end
	end
      end
      @vehicle.save
      @make.update(make_params)
      @make.save
      redirect_to "/ads/#{@ad.id}"
    else
      flash.now[:error] = "*خطأ فى تعديل اﻹعلان"
      render 'edit'
    end
    

  end
  def inputValidation ad
return ad.email.match(/^[[:alpha:]]+[[:punct:]]?[[:alpha:]]*(@[[:alpha:]]+.[[:alpha:]]+){,5}$/) && ad.phone.match(/^\+?+[[:digit:]]{,20}$/)
end
 private

 def ad_params
  ad_params = params.require(:ad).permit(:title,:description, pictures_attributes: [:id, :ad_id, :image])
  ad_params
 end

 def vehicle_params
  vehicle_params = params.require(:vehicle).permit(:make,:model,:manyear,:country,:axles,:gearbox,:colour,:price)
  vehicle_params
 end

 def make_params
  make_params = params[:make].permit(:new,:imported,:purchase)
  make_params
 end

 def van_params
  van_params = params[:van].permit(:capacity,:mileage)
  van_params
 end

 def heavytruck_params
  heavytruck_params = params[:heavytruck].permit(:capacity,:mileage)
  heavytruck_params
 end

 def semitrailer_params
  semitrailer_params = params[:semitrailer].permit(:capacity)
  semitrailer_params
 end

 def semitrailertruck_params
  semitrailertruck_params = params[:semitrailertruck].permit(:mileage)
  semitrailertruck_params
 end
end
