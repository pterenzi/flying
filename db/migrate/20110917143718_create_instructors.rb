class CreateInstructors < ActiveRecord::Migration
  def change
    create_table :instructors do |t|
      t.string :name
      t.integer :level
      t.string :rg
      t.string :cpf
      t.string :instructor_dac
      t.date   :birthday
      t.string :address
      t.string :phone
      t.string :cel
      t.string :email
      t.decimal :hour_price

      t.timestamps
    end
  end
end
