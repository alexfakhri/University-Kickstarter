class ChangeDecimalOnAllAmounts < ActiveRecord::Migration
  def change
  	change_column :projects, :target_amount, :decimal, precision: 8, scale: 2
  	change_column :projects, :funded_so_far, :decimal, precision: 8, scale: 2
  	change_column :donations, :amount, :decimal, precision: 8, scale: 2
  end
end