class CreateAircrafts < ActiveRecord::Migration
  def change
    create_table :aircrafts do |t|
      t.string :prefix
      t.string :type
      t.string :owner
      t.string :manufacturer
      t.string :model
      t.string :color
      t.time :hourmeter
      t.date :maintenance_break
      t.date :last_maintenance
      t.time :flyght_hours
      t.string :details
      t.string :equipment
      t.string :speed
      t.string :operator
      t.references :aircraft_type

      t.timestamps
    end
  end
end
