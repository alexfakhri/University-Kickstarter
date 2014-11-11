require 'rails_helper'

context "User not signed in and on the home page" do

	it "Should see a 'Sign in' and 'Sign up' link" do
		visit '/projects'
		expect(page).to have_link('User sign in')
		expect(page).to have_link('User sign up')
	end
end