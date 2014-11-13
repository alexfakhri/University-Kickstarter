class AddCountryToUniversities < ActiveRecord::Migration
  def change
    add_column :universities, :country, :string
  end
end
