class Users < ActiveRecord::Migration
  def change
    create_table :dogs do |t|
      t.string :username
      t.string :password
      t.decimal :balance
    end
  end
end
