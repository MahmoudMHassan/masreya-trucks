class Vehicle < ActiveRecord::Base
  has_one :semitrailertruck
  has_one :semitrailer
  has_one :heavytruck
  has_one :van
  has_one :seller, through: :make
  has_many :ads, through: :make
end
