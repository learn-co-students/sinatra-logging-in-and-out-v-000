class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    #created with rake db:create_migration NAME=create_users
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :balance
    end
  end
end
