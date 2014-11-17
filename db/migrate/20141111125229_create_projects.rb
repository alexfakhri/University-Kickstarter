class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.date :end_date
      t.decimal :target_amount
      t.decimal :funded_so_far

      t.timestamps
    end
  end
end
