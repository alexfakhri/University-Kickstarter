class University < ActiveRecord::Base

	has_many :projects
	validates :name, length: {minimum: 1}, uniqueness: true

	has_many :users #only in the case of university users

	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  
end
