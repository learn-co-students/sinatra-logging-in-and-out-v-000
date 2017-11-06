class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |table|
      table.string :username
      table.string :password
      table.decimal :balance
    end
  end
end
