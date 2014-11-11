class University < ActiveRecord::Base

	has_many :projects
	validates :name, length: {minimum: 1}, uniqueness: true
end
