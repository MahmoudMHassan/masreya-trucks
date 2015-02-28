class Heavytruck < ActiveRecord::Base
  belongs_to :vehicle, dependent: :destroy
end
