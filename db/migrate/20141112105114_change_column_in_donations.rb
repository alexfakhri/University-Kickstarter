class ChangeColumnInDonations < ActiveRecord::Migration
  def change
  	rename_column :donations, :ammount, :amount
  end
end
