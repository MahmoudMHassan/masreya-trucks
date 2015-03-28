class Picture < ActiveRecord::Base
  belongs_to :ad, dependent: :delete
   mount_uploader :image, ImageUploader
end
