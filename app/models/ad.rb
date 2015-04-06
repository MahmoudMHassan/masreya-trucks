class Ad < ActiveRecord::Base
  has_many :users, through: :bookmark
  has_one :seller, through: :make
  has_many :vehicles, through: :make

  def self.make_search (purchase, newV, imported) 
  	if make 
  		@make = Make.joins(:ad)
  		@make = @make.where('purchase LIKE ?',"%#{purchase}%") if purchase.present?
        @make = @make.where('new LIKE ?',"%#{newV}%") if newV.present?
        @make = @make.where('imported LIKE ?',"%#{imported}%") if imported.present?
  	end 
  end 
end
