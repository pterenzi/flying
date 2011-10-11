class AddAircraftTypeToPackage < ActiveRecord::Migration
  def change
    add_column :packages, :aircraft_type_id, :integer
  end
end
