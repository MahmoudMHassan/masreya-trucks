class Ad < ActiveRecord::Base
  has_many :users, through: :bookmark
  has_one :seller, through: :make
  has_many :vehicles, through: :make
  
  def self.search(sort,make,model,manyear,country,axles,gearbox,colour,price)
    if make
     #ads = Ad.where('id IN(SELECT ad_id FROM makes WHERE vehicle_id IN(SELECT id FROM vehicles WHERE make LIKE ? AND model LIKE ? AND manyear = ? AND country LIKE ? AND axles = ? AND gearbox = ? AND colour LIKE ? AND price = ?))',make,model,manyear,country,axles,gearbox,colour,price)
      makes = Make.joins(:ad, :vehicle)
      makes = makes.where('make LIKE ?',"%#{make}%") if make.present?
      makes = makes.where('model LIKE ?',"%#{model}%") if model.present?
      makes = makes.where('manyear = ?',manyear) if manyear.present?
      makes = makes.where('country LIKE ?',"%#{country}%") if country.present?
      makes = makes.where('axles = ?',axles) if axles.present?
      makes = makes.where('gearbox = ?',gearbox) if gearbox.present?
      makes = makes.where('colour LIKE ?',"%#{colour}%") if colour.present?
      if price.present?
      if price == "0"
      makes = makes.where('price < 120000')
      elsif price == "1"
      makes = makes.where('price >= 120000 and price < 160000')
      elsif price == "2"
      makes = makes.where('price >= 160000 and price < 200000')
      elsif price == "3"
      makes = makes.where('price >= 200000 and price < 240000')
      elsif price == "4"
      makes = makes.where('price >= 240000 and price < 280000')
      elsif price == "5"
      makes = makes.where('price >= 280000')
      end
      end
      if sort == "0"
      makes = makes.order('price ASC')
       elsif sort == "1"
      makes = makes.order('price DESC')
       elsif sort == "3"
      makes = makes.order('manyear ASC')
       elsif sort == "4"
      makes = makes.order('manyear DESC')
       end
      
     #ads = Ad.where('id IN(SELECT ad_id FROM makes WHERE vehicle_id IN(?))',vehicles)
     makes
    else
      Ad.all
    end
  end
end
