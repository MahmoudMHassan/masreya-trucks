class Van < ActiveRecord::Base
  belongs_to :vehicle, dependent: :destroy
end
