class AddAircraftTypeToEntry < ActiveRecord::Migration
  def change
    add_column :entries, :aircraft_type_id, :integer
  end
end
