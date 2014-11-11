require 'rails_helper'

describe 'projects' do

	context 'no projects have been added' do
		it "should display a prompt to add a project" do
			visit '/projects'
			expect(page).to have_content("No projects")
			expect(page).to have_link("Add a project")
		end
	end

	context 'projects have been added' do
		before do
			Project.create(title: 'Sports Hall', description: 'Test description', target_amount: 20000)
		end

		it 'should display projects' do
			visit '/projects'
			expect(page).to have_content('Sports Hall')
			expect(page).to have_content('Test description')
			expect(page).to have_content('20000')
			expect(page).not_to have_content('No projects yet')
		end
	end
end

describe 'creating projects' do
	it 'prompts user to fill out a form, then displays the new project' do
		visit '/projects'
		click_link 'Add a project'
		fill_in 'Title', with: 'Sports Hall'
		fill_in 'Description', with: 'Test description'
		fill_in 'Funding target', with: "20000"
		# fill_in 'End Date', with: "01/01/2015"
		click_button 'Create Project'
		expect(page).to have_content 'Sports Hall'
		expect(page).to have_content 'Test description'
		expect(current_path).to eq '/projects'
	end
end
