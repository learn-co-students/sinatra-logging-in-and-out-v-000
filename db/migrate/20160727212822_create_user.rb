class CreateUser < ActiveRecord::Migration
  def change
    create_table :user do |t|
      t.string :username
      t.string :password
      t.decimal :balance
    end
  end
end
