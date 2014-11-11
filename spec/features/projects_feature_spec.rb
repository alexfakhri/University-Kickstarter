require 'rails_helper'

describe 'projects' do

		before do
			University.create(name: 'Oxford', description: 'Test description', id: 1)
		end

	context 'no projects have been added' do

		it "should display a prompt to add a project" do
			visit university_path(1)
			expect(page).to have_content("No projects")
			expect(page).to have_link("Add a project")
		end
	end

	context 'projects have been added' do

		it 'should display projects' do
			Project.create(title: 'Sports Hall', description: 'Test description', end_date: '01/01/2015', target_amount: 20000, university_id: 1)
			visit university_path(1)
			expect(page).to have_content('Sports Hall')
			expect(page).to have_content('Test description')
			expect(page).to have_content('20000')
			expect(page).not_to have_content('No projects yet')
		end
	end
end
