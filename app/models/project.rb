class Project < ActiveRecord::Base

	belongs_to :university
	validates :title, length: {minimum: 1} 
	validates :description, length: {minimum: 1}

end
