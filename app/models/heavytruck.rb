class Heavytruck < ActiveRecord::Base
  belongs_to :vehicle
  validates_presence_of(:mileage)
end
