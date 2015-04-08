class Semitrailer < ActiveRecord::Base
  has_one :vehicle, as: :vehicable

end
