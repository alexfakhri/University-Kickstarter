require 'rails_helper'

describe "Donations" do 

	before do 
		visit '/projects'
		click_link 'User sign up'
		fill_in('Email', with: 'test@test.com')
		fill_in('Password', with: '12345678')
		fill_in('Password confirmation', with: '12345678')
		click_button('Sign up')
		University.create(name: 'Oxford', description: 'Test description', id: 1)
		Project.create(title: 'Sports Hall', description: 'Test description', target_amount: 20000, university_id: 1, end_date: "01/01/2015", id: 1)

	end

	context "A user, when signed in, should" do 


		it "be able to see a 'donate' link" do 
			visit '/projects'
			expect(page).to have_content('Test description')
			expect(page).to have_content('Donate to project')
		end

		it "be able to click 'donate' link and enter donation" do 
			visit '/projects'
			click_link 'Donate to project'
			fill_in 'Amount', with: '30.00'
			click_button 'Make Donation'
			expect(current_path).to eq '/'
		end

	end

	context "When a donation is made" do

		it "the project should update with the donations made" do
			visit '/projects'
			click_link 'Donate to project'
			fill_in 'Amount', with: '30.00'
			click_button 'Make Donation'
			expect(page).to have_content '30.0'
		end

	end

end