class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.decimal :ammount
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
