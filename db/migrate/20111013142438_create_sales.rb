class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.references :client
      t.date       :date
      t.references :package
      t.decimal    :value, :precision=>8, :scale=>2
      t.decimal    :hours, :precision=>2, :scale=>1
      t.string     :description
      t.timestamps
    end
  end
end
