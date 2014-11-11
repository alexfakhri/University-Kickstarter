require 'rails_helper'

context "A user, when signed in, should" do 

	it "be able to see a 'donate' link" do 
		visit '/projects'
		click_link 'Add a project'
		fill_in('Title', with: 'Awesome Project')
		fill_in('Description', with: 'The best of the best')
		click_button('Create Project')
		visit '/projects'
		expect(page).to have_content('The best of the best')
		expect(page).to have_link('Donate to project')
	end
end