class Seller < ActiveRecord::Base
  belongs_to :user
  has_many :ads
  has_many :vehicles, through: :make
end
