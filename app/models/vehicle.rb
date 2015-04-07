class Vehicle < ActiveRecord::Base
  has_one :seller, through: :make
  has_many :ads, through: :make, dependent: :destroy
  accepts_nested_attributes_for :heavytruck, :allow_destroy => true

end
