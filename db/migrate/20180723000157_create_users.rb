class CreateUsers < ActiveRecord::Migration[5.1]
    create_table :users do |t|
      t.string :username
      t.string :password
      t.decimal :balance
    end
  end
