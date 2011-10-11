class AddPackageToAccount < ActiveRecord::Migration
  def change
    add_column :accounts, :package_id, :integer
  end
end
