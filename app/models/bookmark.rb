class Bookmark < ActiveRecord::Base
  belongs_to :user
  belongs_to :ad
  validates_uniqueness_of :ad_id, :scope => :user_id
end
