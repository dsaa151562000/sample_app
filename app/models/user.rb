class User < ActiveRecord::Base
before_save { self.email = email.downcase }
before_create :create_remember_token
	#validates(:name, presence: true)
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  has_secure_password
  validates :password, presence: true,length: { minimum: 6 }

def User.new_remember_token
SecureRandom.urlsafe_base64
end

def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
end

private
def create_remember_token
# オブジェクト内部への要素代入がしたいので、selfで参照する
# before_saveの下りと同じ
self.remember_token = User.encrypt(User.new_remember_token)
end
  
end
