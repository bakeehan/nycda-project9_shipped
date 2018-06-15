class Job < ApplicationRecord
	belongs_to :boat
	belongs_to :user
	validates :title, uniqueness: true
	validates :title, :info, :origin, :destination, :cost, :containers, :boat_id, :user_id, presence: true
end