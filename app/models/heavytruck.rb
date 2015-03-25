class Heavytruck < ActiveRecord::Base
  has_one :vehicle, as: :vehicable

end
