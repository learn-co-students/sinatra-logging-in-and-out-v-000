class CreateUsers < ActiveRecord::Migration
  def change
  #Create a Users table
    create_table :users do |t|
      ##Users should have a username, password, and balance
      t.string :username
      t.string :password
      t.decimal :balance
    end
  end
end
