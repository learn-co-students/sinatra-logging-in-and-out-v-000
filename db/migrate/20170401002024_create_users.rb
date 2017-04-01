class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
     t.string :username
     t.string :password
     t.decimal :balance, precision: 16, scale: 2
   end
  end
end
