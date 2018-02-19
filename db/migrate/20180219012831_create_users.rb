class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :username
      t.text :password
      t.decimal :balance
      t.timestamps
    end
  end
end
