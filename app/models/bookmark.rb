class Bookmark < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  belongs_to :ad, dependent: :destroy
end
