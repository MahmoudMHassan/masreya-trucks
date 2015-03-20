class Semitrailertruck < ActiveRecord::Base
  belongs_to :vehicle, dependent: :destroy
      self.inheritance_column = nil
end
