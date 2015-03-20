class AdsController < ApplicationController
  def new
  end
   def home
     @ads = Ad.all.order('created_at DESC').first(7)
  end
  def show
    @ad = Ad.find(params[:id]) if Ad.exists?(params[:id])
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
    sql = "DELETE FROM bookmarks WHERE user_id = #{self.current_user.id} and ad_id = #{params[:id]}"
    ActiveRecord::Base.connection.execute(sql)
    redirect_to "/ads/#{params[:id]}"
  end
 
end
