class ChangeAccountIdPrSaleIdInBalanceTable < ActiveRecord::Migration
  def up
    add_column    :balances, :sale_id, :integer
    remove_column :balances, :account_id
  end

  def down
    add_column    :balances, :account_id, :integer
    remove_column :balances, :sale_id
  end
end
