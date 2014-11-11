require 'rails_helper'

RSpec.describe Project, :type => :model do
	it 'has a valid name' do
		Project.new(title: "").should_not be_valid
	end

	it 'should have a valid description' do
		Project.new(title: "gym", description: "project test").should be_valid
		Project.new(title: "gym", description: "").should_not be_valid
	end

	it 'should have a valid end date' do
		Project.new(title: "gym", description: "project test", end_date: "01/01/2015").should be_valid
	end
end
