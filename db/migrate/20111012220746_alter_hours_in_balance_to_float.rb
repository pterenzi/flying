class AlterHoursInBalanceToFloat < ActiveRecord::Migration
  def up
    change_column :balances, :hours, :float
  end

  def down
    change_column :balances, :hours, :integer
  end
end
