class Project < ActiveRecord::Base

	validates :title, length: {minimum: 1} 
	validates :description, length: {minimum: 1}

end
