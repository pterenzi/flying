class AddHoursToAccount < ActiveRecord::Migration
  def change
    add_column :accounts, :hours, :integer
  end
end
