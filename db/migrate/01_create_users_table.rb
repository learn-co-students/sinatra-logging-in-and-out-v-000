class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :password
      t.decimal :balance
    end
  end
end
