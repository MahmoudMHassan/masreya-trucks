class Seller < ActiveRecord::Base
  belongs_to :user
  has_many :ads, through: :make
  has_many :vehicles, through: :make
end
