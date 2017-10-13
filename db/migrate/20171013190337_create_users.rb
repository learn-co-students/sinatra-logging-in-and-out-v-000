class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |col|
      col.string :username
      col.string :password
      col.decimal :balance 
    end
  end
end
