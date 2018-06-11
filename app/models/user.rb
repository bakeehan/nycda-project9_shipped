class User < ApplicationRecord
	has_secure_password
	has_many :jobs
	has_many :boats, :through => :jobs
end
