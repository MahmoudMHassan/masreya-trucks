class User < ActiveRecord::Base
  has_many :ads, through: :bookmark
  has_one :seller
  has_one :buyer

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
