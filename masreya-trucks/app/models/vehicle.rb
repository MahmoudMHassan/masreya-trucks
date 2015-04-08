class Vehicle < ActiveRecord::Base
  has_one :semitrailertruck, dependent: :destroy
  has_one :semitrailer, dependent: :destroy
  has_one :heavytruck, dependent: :destroy
  has_one :van, dependent: :destroy
  has_one :seller, through: :make
  has_many :ads, through: :make, dependent: :destroy
  has_one :heavytruck
  validates_presence_of(:make)
  validates_presence_of(:model)
  validates_presence_of(:manyear)
  validates_presence_of(:country)
  validates_presence_of(:axles)
  #validates_presence_of(:gearbox)
  validates_presence_of(:colour)
  validates_presence_of(:price)
end
