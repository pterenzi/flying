class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.date       :due_date
      t.date       :entry_date
      t.references :client
      t.decimal    :value, :precision=>8, :scale=>2
      t.decimal    :interest, :precision=>8, :scale=>2
      t.decimal    :discount, :precision=>8, :scale=>2
      t.string     :description
      
      t.timestamps
    end
  end
end
