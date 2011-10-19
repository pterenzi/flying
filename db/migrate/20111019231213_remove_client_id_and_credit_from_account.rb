class RemoveClientIdAndCreditFromAccount < ActiveRecord::Migration
  def up
    remove_column :accounts, :client_id
    remove_column :accounts, :credit
  end

  def down
    add_column :accounts, :client_id, :integer
    add_column :accounts, :credit, :boolean
  end
end
