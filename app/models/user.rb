class User < ApplicationRecord

	attr_accessor :remember_token

	has_secure_password

	after_create: generate_token

	def generate_token
    	self.token = loop do
      		random_token = SecureRandom.urlsafe_base64(nil, false)
      		Digest::SHA1.hexdigest(random_token.to_s)
      		break random_token unless ModelName.exists?(token: random_token)
    	end
	end
end
