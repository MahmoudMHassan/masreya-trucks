class Ad < ActiveRecord::Base
  has_many :users, through: :bookmark
  has_one :seller, through: :make
  has_many :vehicles, through: :make
  has_one :van
  has_one :semitrailer
  has_one :semitrailertruck
  has_one :heavytruck
  has_one :make
  accepts_nested_attributes_for :vehicles, :van, :semitrailer, :semitrailertruck, :heavytruck , :make
  
  def self.search(sort,make,model,manyear,country,axles,gearbox,colour,price)
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
       elsif sort == "2"
      makes = makes.order('manyear ASC')
       elsif sort == "3"
      makes = makes.order('manyear DESC')
       end

      makes
  end
  
  def self.vansearch(sort,make,model,manyear,country,axles,gearbox,colour,price,capacity,mileage)
    
      makes = Make.joins(:ad, vehicle: :van)
      
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
       elsif sort == "2"
      makes = makes.order('manyear ASC')
       elsif sort == "3"
      makes = makes.order('manyear DESC')
       end
      makes = makes.where('capacity = ?', capacity) if capacity.present?
      makes = makes.where('mileage = ?', mileage) if mileage.present?
    
      makes

  end
  
end
