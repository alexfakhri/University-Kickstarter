require 'rails_helper'

RSpec.describe University, :type => :model do
  
	it 'has a valid name' do
  	University.new(:name => "").should_not be_valid
	end

	it 'does not allow duplicate names' do
		University.create(:name => "a")
		University.new(:name => "a").should_not be_valid
	end

end