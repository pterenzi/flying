class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.date       :date
      t.references :client
      t.decimal    :value, :precision=>8, :scale=>2
      t.string     :description
      
      t.timestamps
    end
  end
end
