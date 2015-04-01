class Ad < ActiveRecord::Base
  has_many :users, through: :bookmark
  has_one :seller, through: :make
  has_many :vehicles, through: :make
  
  def self.search(make,model,manyear,country,axles,gearbox,colour,price)
    if make
     #ads = Ad.where('id IN(SELECT ad_id FROM makes WHERE vehicle_id IN(SELECT id FROM vehicles WHERE make LIKE ? AND model LIKE ? AND manyear = ? AND country LIKE ? AND axles = ? AND gearbox = ? AND colour LIKE ? AND price = ?))',make,model,manyear,country,axles,gearbox,colour,price)
      vehicles = Vehicle.all
      vehicles = vehicles.where('make LIKE ?',"%#{make}%") if make.present?
      vehicles = vehicles.where('model LIKE ?',"%#{model}%") if model.present?
      vehicles = vehicles.where('manyear = ?',manyear) if manyear.present?
      vehicles = vehicles.where('country LIKE ?',"%#{country}%") if country.present?
      vehicles = vehicles.where('axles = ?',axles) if axles.present?
      vehicles = vehicles.where('gearbox = ?',gearbox) if gearbox.present?
      vehicles = vehicles.where('colour LIKE ?',"%#{colour}%") if colour.present?
      vehicles = vehicles.where('price = ?',price) if price.present?
      vehicles = vehicles.pluck(:id)

     ads = Ad.order(:title)
     ads = ads.where('id IN(SELECT ad_id FROM makes WHERE vehicle_id IN(?))',vehicles) 
     ads
    else
      Ad.all
    end
  end
end
