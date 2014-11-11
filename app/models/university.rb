class University < ActiveRecord::Base

	validates :name, length: {minimum: 1}, uniqueness: true
end
