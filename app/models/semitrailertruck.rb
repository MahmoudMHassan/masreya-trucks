class Semitrailertruck < ActiveRecord::Base
  has_one :vehicle, as: :vehicable
end
