class AddLandingsToFlights < ActiveRecord::Migration
  def change
      add_column :flights, :landings, :integer
  end
end
