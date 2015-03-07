class User < ActiveRecord::Base
  has_many :ads, through: :bookmark
  has_one :seller
  has_one :buyer
  validates_uniqueness_of :email
  validates :fname, presence: true
  validates :password, presence: true
  validates :phone, presence: true

  def self.login?(email, password)
    member = User.where(email: email).take
    if member != nil
      if member.password == password
      return true
      end
    end
    return false
  end
end
