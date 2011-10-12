class AddAircraftIdToFlights < ActiveRecord::Migration
  def change
    add_column :flights, :aircraft_id, :integer
  end
end
