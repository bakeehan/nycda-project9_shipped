class Job < ApplicationRecord
	belongs_to :boats
	belongs_to :users
	validates :title, uniqueness: true
	validates :title, :info, :origin, :destination, :cost, :containers, :boat_id, :user_id, presence: true
end
