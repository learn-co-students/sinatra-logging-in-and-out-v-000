class CreateUsersTable < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :email
      t.integer :balance
    end # end of create_table
  end # end of def change
    
end # end of Class