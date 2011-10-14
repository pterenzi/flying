class ChangeStatusNameToPayed < ActiveRecord::Migration
  def up
    remove_column :accounts, :status
    add_column :accounts, :payed, :boolean, :default=>false
    add_column :entries, :received, :boolean, :default=>false
  end

  def down
    remove_column :entries, :received
    remove_column :accounts, :payed
    add_column :accounts, :status, :boolean
  end
end
