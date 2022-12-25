require "openssl"

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :vouches
  has_many :accounts

  devise :omniauthable, omniauth_providers: %i[instagram_basic]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    after_initialize do |user|
        rsa_key = OpenSSL::PKey::RSA.new(2048)
        user.private_key = rsa_key.to_s
        user.public_key = rsa_key.public_key.to_s
        user.reputation = 0
        user.following = 0
        user.account_num = 0
        user.save
    end

    def sign(message)
        private_key = OpenSSL::PKey::RSA.new(self.private_key)
        return private_key.sign(OpenSSL::Digest::SHA256.new, message)
    end

    def verify(public_key_pem, signature, message)
        public_key = OpenSSL::PKey::RSA.new(self.public_key)
        return public_key.verify(OpenSSL::Digest::SHA256.new, signature, message)
    end 

    def self.from_omniauth(auth)
        find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
          user.email = auth.info.email
          user.password = Devise.friendly_token[0, 20]
          user.name = auth.info.name   
          user.image = auth.info.image
        end
    end

end
