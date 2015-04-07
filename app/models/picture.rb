class Picture < ActiveRecord::Base
  belongs_to :make, dependent: :delete
   mount_uploader :image, ImageUploader
end
