class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.database_authenticatable
#       t.confirmable
      t.recoverable
      t.rememberable
      t.trackable
      # t.lockable
      t.string  :name
      t.integer :level

      t.timestamps
    end
    
    add_index :users, :email,                :unique => true
    add_index :users, :name,                 :unique => true
    add_index :users, :reset_password_token, :unique => true

  end
end
