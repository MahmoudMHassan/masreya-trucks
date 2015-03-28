class Van < ActiveRecord::Base
  has_one :vehicle, as: :vehicable

end
