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
			Project.create(title: 'Sports Hall', description: 'Test description')
		end

		it 'should display projects' do
			visit '/projects'
			expect(page).to have_content('Sports Hall')
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
		click_button 'Create Project'
		expect(page).to have_content 'Sports Hall'
		expect(page).to have_content 'Test description'
		expect(current_path).to eq '/projects'
	end
end
