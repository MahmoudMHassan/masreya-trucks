class Ad < ActiveRecord::Base
  has_many :users, through: :bookmark
  has_one :seller, through: :make
  has_many :vehicles, through: :make

  def self.make_search (purchase, newV, imported) 
  		@make = Make.joins(:ad)
        if purchase.present?
       if (purchase == "للبيع")
  		@make = @make.where('purchase LIKE ?',"1") 
        else 
          @make = @make.where('purchase LIKE ?',"0") 
        end 
      end 
      if (newV.present?)
        if (newV == "جديدة")
        @make = @make.where('new LIKE ?',"1") 
      else 
        @make = @make.where('new LIKE ?',"0")
       end 
       end 
       if (imported.present?)
          if imported == "مستوردة"  
        @make = @make.where('imported LIKE ?',"1") 
        else 
          @make = @make.where('imported LIKE ?',"0") 
        end 
      end 
      @make
  end 
end
