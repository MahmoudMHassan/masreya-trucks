class Ad < ActiveRecord::Base
  has_many :users, through: :bookmark
  has_one :seller, through: :make
  has_many :vehicles, through: :make
  has many :pictures
  validates :pictures, :length => { :maximum => 8 }
end
