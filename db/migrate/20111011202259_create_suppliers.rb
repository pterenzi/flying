class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string  :name
      t.boolean :active

      t.timestamps
    end
    add_column :accounts, :supplier_id, :integer
  end
end
