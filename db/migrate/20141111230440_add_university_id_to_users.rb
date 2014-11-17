class AddUniversityIdToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :university, index: true
  end
end
