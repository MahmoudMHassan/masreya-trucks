class User < ActiveRecord::Base
  has_many :ads, through: :bookmark
  has_one :seller
  has_one :buyer
end
