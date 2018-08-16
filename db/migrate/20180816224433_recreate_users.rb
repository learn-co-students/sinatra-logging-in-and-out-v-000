class RecreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.integer :balance
      t.string :password
    end
  end
end

