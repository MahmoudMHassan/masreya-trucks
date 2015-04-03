class Ad < ActiveRecord::Base
  has_many :users, through: :bookmark
  has_one :seller, through: :make
  has_many :vehicles, through: :make
  
  def self.search(sort,make,model,manyear,country,axles,gearbox,colour,price)
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
      if price.present?
      if price == "0"
      vehicles = vehicles.where('price < 120000')
      elsif price == "1"
      vehicles = vehicles.where('price >= 120000 and price < 160000')
      elsif price == "2"
      vehicles = vehicles.where('price >= 160000 and price < 200000')
      elsif price == "3"
      vehicles = vehicles.where('price >= 200000 and price < 240000')
      elsif price == "4"
      vehicles = vehicles.where('price >= 240000 and price < 280000')
      elsif price == "5"
      vehicles = vehicles.where('price >= 280000')
      end
      end
#      if sort == "0"
#       vehicles.order('price ASC')
#       elsif sort == "1"
#       vehicles.order('price DESC')
#       elsif sort == "3"
#       vehicles.order('manyear ASC')
#       elsif sort == "4"
#       vehicles.order('manyear DESC')
#       end

      vehicles = vehicles.pluck(:id)
     ads = Ad.where('id IN(SELECT ad_id FROM makes WHERE vehicle_id IN(?))',vehicles)
     ads
    else
      Ad.all
    end
  end
end
