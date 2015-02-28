class Make < ActiveRecord::Base
  belongs_to :vehicle, dependent: :destroy
  belongs_to :seller, dependent: :destroy
  belongs_to :ad, dependent: :destroy
end
