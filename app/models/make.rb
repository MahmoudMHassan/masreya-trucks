class Make < ActiveRecord::Base
  belongs_to :vehicle
  belongs_to :seller
  belongs_to :ad
  validates_uniqueness_of :ad_id, :scope => [:user_id,:vehicle_id]
end
