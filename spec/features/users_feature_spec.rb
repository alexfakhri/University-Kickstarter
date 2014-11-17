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

	it "Should not be able to donate to a project" do
		University.create(name: 'Oxford', description: 'Test description', id: 1)
		Project.create(title: 'Sports Hall', description: 'Test description', target_amount: 20000, university_id: 1, end_date: "01/01/2015", id: 1)
      	visit '/projects'
      	click_link 'Donate to project'
      	expect(page).to have_content('Log in')

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

context "University signing up to the systme" do

	before do
			University.create(name: 'Oxford', description: 'Test description', id: 1)
	end


	it "Should be able to select a university from the drop down menu" do
		visit '/'
		click_link 'User sign up'
		fill_in('Email', with: 'test@oxford.com')
		fill_in('Password', with: '12345678')
		fill_in('Password confirmation', with: '12345678')
		check 'uni-select'
		select 'Oxford', from: "collection_select"
		click_button 'Sign up'
		expect(page).to_have content 'Welcome'
	end
end