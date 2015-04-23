class Semitrailertruck < ActiveRecord::Base
  has_one :vehicle, as: :vehicable
  validates_presence_of(:mileage)
end
