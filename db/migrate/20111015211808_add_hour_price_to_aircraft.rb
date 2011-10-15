class AddHourPriceToAircraft < ActiveRecord::Migration
  def change
    add_column :aircrafts, :hour_price, :decimal, :precision=>6, :scale=>2
  end
end
