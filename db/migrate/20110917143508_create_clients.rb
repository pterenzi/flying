class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :cpf
      t.string :rg
      t.string :client_dac
      t.date :birthday
      t.string :address
      t.string :city
      t.string :state
      t.string :cep
      t.string :phone
      t.string :cel
      t.string :email
      t.integer :credit

      t.timestamps
    end
  end
end
