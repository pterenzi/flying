class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.string :name
      t.integer :quantity
      t.decimal :hour_price, :decimal, :precision => 6, :scale => 2

      t.timestamps
    end
  end
end
