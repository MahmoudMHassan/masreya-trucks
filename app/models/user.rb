class User < ActiveRecord::Base
	has_many :authentications, :dependent => :delete_all
 def apply_omniauth(auth)
  # In previous omniauth, 'user_info' was used in place of 'raw_info'
  self.email = auth['extra']['raw_info']['email']
  # Again, saving token is optional. If you haven't created the column in authentications table, this will fail
  authentications.build(:provider => auth['provider'], :uid => auth['uid'], :token => auth['credentials']['token'])
  end 

 def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.provider = auth.provider 
    user.uid      = auth.uid
    user.name     = auth.info.name
    user.save
  end
end
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
