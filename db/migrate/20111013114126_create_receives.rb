class CreateReceives < ActiveRecord::Migration
  def change
    create_table :receives do |t|
      t.date        :date
      t.string      :description
      t.decimal     :value, :precision => 8, :scale => 2
      t.references  :client
      t.timestamps
    end
  end
end
