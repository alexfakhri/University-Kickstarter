require 'rails_helper'

context "User not signed in and on the home page" do

	it "Should see a 'Sign in' and 'Sign up' link" do
		visit '/projects'
		expect(page).to have_link('User sign in')
		expect(page).to have_link('User sign up')
	end

	it "Should not see a sign out link" do 
		visit '/projects'
		expect(page).not_to have_content('User sign out')
	end

end

context "User signed in on the homepage" do 

	before do 
		visit '/projects'
		click_link 'User sign up'
		fill_in('Email', with: 'test@test.com')
		fill_in('Password', with: '12345678')
		fill_in('Password confirmation', with: '12345678')
		click_button('Sign up')
	end

	it "should see a sign out link" do 
		visit '/projects'
		expect(page).to have_link('Sign out')
	end 

	it " should not see a 'Sign in' and 'Sign up' link" do 
		visit '/projects'
		expect(page).not_to have_link('User sign in')
		expect(page).not_to have_link('User sign up')
	end 
end