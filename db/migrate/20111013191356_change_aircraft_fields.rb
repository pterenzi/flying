class ChangeAircraftFields < ActiveRecord::Migration
  def up
    change_column :aircrafts, :hourmeter, :integer
    change_column :aircrafts, :flyght_hours, :integer
    change_column :aircrafts, :owner, :boolean
  end

  def down
    change_column :aircrafts, :hourmeter, :time
    change_column :aircrafts, :flyght_hours, :time
    change_column :aircrafts, :owner, :string
  end
end
