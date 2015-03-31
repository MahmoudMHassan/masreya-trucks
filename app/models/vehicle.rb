class Vehicle < ActiveRecord::Base
  belongs_to :vehicable, :polymorphic => true

  #   has_one :semitrailertruck, dependent: :destroy
  #   has_one :semitrailer, dependent: :destroy
  #   has_one :heavytruck, dependent: :destroy
  #   has_one :van, dependent: :destroy
  has_one :seller, through: :make
  has_many :ads, through: :make, dependent: :destroy
  accepts_nested_attributes_for :heavytruck, :allow_destroy => true
end
