class Picture < ActiveRecord::Base
  belongs_to :ad
  mount_uploader :image, ImageUploader
end
