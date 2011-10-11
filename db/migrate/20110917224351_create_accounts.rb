class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer :client_id
      t.integer :type
      t.integer :company_id
      t.date :due_date
      t.string :description
      t.decimal :value
      t.string :barcode
      t.boolean :status
      t.date :payment_date
      t.decimal :interest
      t.decimal :discount
      t.text :comments

      t.timestamps
    end
  end
end
