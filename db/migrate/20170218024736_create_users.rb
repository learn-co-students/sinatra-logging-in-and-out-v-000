class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |column|
      column.string :username
      column.string :password
      column.decimal :balance
    end
  end
end
