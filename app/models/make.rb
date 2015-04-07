class Make < ActiveRecord::Base
  belongs_to :vehicle
  belongs_to :seller
  belongs_to :ad
  has_many :pictures
  validates_uniqueness_of :ad_id, :scope => [:user_id,:vehicle_id]
  accepts_nested_attributes_for :vehicle, :allow_destroy => true
  accepts_nested_attributes_for :ad, :allow_destroy => true
  accepts_nested_attributes_for :pictures, :allow_destroy => true

    
end
