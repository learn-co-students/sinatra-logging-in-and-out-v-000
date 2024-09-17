class CreateUsers < ActiveRecord::Migration

    def change
      create_table :users do |t|
        t.string :username
        t.string :password
        t.integer :account_balance
      end
    end


end