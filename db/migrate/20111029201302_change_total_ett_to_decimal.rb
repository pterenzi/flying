class ChangeTotalEttToDecimal < ActiveRecord::Migration
  def up
    change_column :flights, :total_ett, :decimal, :precision=>2, :scale=>1 
    change_column :flights, :endurance, :decimal, :precision=>2, :scale=>1 

  end

  def down
  end
end
