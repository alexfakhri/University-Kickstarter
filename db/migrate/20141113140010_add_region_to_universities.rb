class AddRegionToUniversities < ActiveRecord::Migration
  def change
    add_column :universities, :region, :string
  end
end
