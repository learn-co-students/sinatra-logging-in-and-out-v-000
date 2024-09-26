class CreateUser < ActiveRecord::Migration[5.1]
  def change
    create_table :User do |t|
      t.string :username
      t.string :password
      t.decimal :balance
    end
  end
end
