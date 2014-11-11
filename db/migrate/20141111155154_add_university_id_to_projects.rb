class AddUniversityIdToProjects < ActiveRecord::Migration
  def change
    add_reference :projects, :university, index: true
  end
end
