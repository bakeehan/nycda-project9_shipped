class Boat < ApplicationRecord
	has_many :jobs
	has_many :users, :through => :jobs

	validates :name, uniqueness: true
	validates :name, :containers, :location, presence: true 

end
