class Project < ActiveRecord::Base

	belongs_to :university
	validates :title, length: {minimum: 1} 
	validates :description, length: {minimum: 1}

	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

end
