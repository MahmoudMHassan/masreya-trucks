class Semitrailertruck < ActiveRecord::Base
  belongs_to :vehicle
      self.inheritance_column = nil
end
