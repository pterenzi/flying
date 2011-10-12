class CreateBalances < ActiveRecord::Migration
  def change
    create_table :balances do |t|
      t.references :client
      t.datetime   :date
      t.references :account
      t.references :flight
      t.references :aircraft_type
      t.integer    :hours

      t.timestamps
    end
    add_index :balances, :client_id
    add_index :balances, :account_id
    add_index :balances, :flight_id
  end
end
