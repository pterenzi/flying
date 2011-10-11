class CreateAircraftTypes < ActiveRecord::Migration
  def change
    create_table :aircraft_types do |t|
      t.string :name

      t.timestamps
    end
    
    AircraftType.create(:name =>"Helicóptero")
    AircraftType.create(:name =>"Avião")
    AircraftType.create(:name =>"Ultra-leve")
  end
end
