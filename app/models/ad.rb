class Ad < ActiveRecord::Base
  has_many :users, through: :bookmark
  has_one :seller, through: :make
  has_many :vehicles, through: :make
  has_many :pictures
  has_one :van
  has_one :semitrailer
  has_one :semitrailertruck
  has_one :heavytruck
  has_one :make,dependent: :destroy 
  validates_presence_of(:title)
  
#   mount_uploader :image , ImageUploader
#   mount_uploader :image1 , Image1Uploader
#   mount_uploader :image2 ,Image2Uploader
#   mount_uploader :image3 ,Image3Uploader
#   mount_uploader :image4 ,Image4Uploader
  accepts_nested_attributes_for :vehicles, :van, :semitrailer, :semitrailertruck, :heavytruck , :make,:pictures
 


  def self.search(sort,make,model,manyear,country,axles,gearbox,colour,price_from,price_to,capacity,mileage,type,new,sale)
    if type == "van"
      makes = Make.joins(:ad, vehicle: :van)
      makes = makes.where('capacity = ?', capacity) if capacity.present?
      makes = makes.where('mileage = ?', mileage) if mileage.present?
    elsif type == "semi"
      makes = Make.joins(:ad, vehicle: :semitrailer)
      makes = makes.where('capacity = ?', capacity) if capacity.present?
    elsif type == "stt"
      makes = Make.joins(:ad, vehicle: :semitrailertruck)
      makes = makes.where('mileage = ?', mileage) if mileage.present?
    elsif type == "heavy"
      makes = Make.joins(:ad, vehicle: :heavytruck)
      makes = makes.where('capacity = ?', capacity) if capacity.present?
      makes = makes.where('mileage = ?', mileage) if mileage.present?
    else
      makes = Make.joins(:ad, :vehicle)

      end
      makes = makes.where('make LIKE ?',"%#{make}%") if make.present?
      makes = makes.where('model LIKE ?',"%#{model}%") if model.present?
      makes = makes.where('manyear = ?',manyear) if manyear.present?
      makes = makes.where('country LIKE ?',"%#{country}%") if country.present?
      makes = makes.where('axles = ?',axles) if axles.present?
      makes = makes.where('gearbox = ?',gearbox) if gearbox.present?
      makes = makes.where('colour LIKE ?',"%#{colour}%") if colour.present?

      if price_to.present? and !price_from.present?
	makes = makes.where('price <= ?',price_to)
      elsif !price_to.present? and price_from.present?
	makes = makes.where('price >= ?',price_from)
      elsif price_to.present? and price_from.present?
	makes = makes.where('price <= ? and price >= ?',price_to,price_from)
      end
      if sort == "0"

      makes = makes.order('price ASC')
    elsif sort == "1"
      makes = makes.order('price DESC')
    elsif sort == "2"
      makes = makes.order('manyear ASC')
    elsif sort == "3"
      makes = makes.order('manyear DESC')
    elsif sort == "4"
      makes = makes.order('updated_at ASC')
    elsif sort == "5"
      makes = makes.order('updated_at DESC')
    else
      makes = makes.order('price ASC')

      end
      if new.present?
          makes = makes.where('new = ?',new)
      end
      if sale.present?
	makes = makes.where('sale = ?',sale)
      end

        makes
    end

end
