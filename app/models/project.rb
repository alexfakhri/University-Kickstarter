class Project < ActiveRecord::Base

	belongs_to :university
	belongs_to :user
	validates :title, length: {minimum: 1} 
	validates :description, length: {minimum: 1}

	has_attached_file :image, :styles => { :large => "825x400^", :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

	has_many :donations

	def total_donations 
		return 0 if donations.none?
		donations.inject(0) {|memo, donation| memo + donation.amount} 
	end

	def unique_donations
		donations_user_ids = []
		self.donations.each do |donation|
			donations_user_ids << donation.user_id
		end	
		return donations_user_ids.uniq.count
	end

	def donation_percentage
		self.total_donations / self.target_amount * 100
	end

	def days_left
		(self.end_date - Date.today).to_i
	end

end
