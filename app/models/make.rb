class Make < ActiveRecord::Base
  belongs_to :vehicle
  belongs_to :seller
  belongs_to :ad
end
