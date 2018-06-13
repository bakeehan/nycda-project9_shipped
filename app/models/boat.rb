class Boat < ApplicationRecord
	has_attached_file :image, styles: { large: "600x660>", medium: "300x300>", thumb: "100x100#" }
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
	has_many :jobs
	has_many :users, :through => :jobs

	validates :name, uniqueness: true
	validates :name, :containers, :location, presence: true

end
