class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |u|
      u.string :username
      u.string :password
      u.decimal :balance, precision: 10, scale: 2
    end
  end
end
