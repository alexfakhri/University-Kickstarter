class GiveNumbersADefaultOfZero < ActiveRecord::Migration
  def change
  	change_column :donations, :amount, :decimal, default: 0, precision: 8, scale: 2
  	change_column :projects, :funded_so_far, :decimal, default: 0, precision: 8, scale: 2
  	change_column :projects, :target_amount, :decimal, default: 0, precision: 8, scale: 2
  end
end
