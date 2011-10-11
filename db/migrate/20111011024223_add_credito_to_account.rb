class AddCreditoToAccount < ActiveRecord::Migration
  def change
    add_column :accounts, :credit , :boolean, :default => false
  end
end
