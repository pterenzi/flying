class AddAircraftTypeToInstructor < ActiveRecord::Migration
  def change
    add_column :instructors, :aircraft_type_id, :integer
  end
end
