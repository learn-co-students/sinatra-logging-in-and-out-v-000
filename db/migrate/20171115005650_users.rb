class Users < ActiveRecord::Migration
  def change
    create_table :dogs do |t|
      t.string :username
      t.string :password
      t.string :balance
    end
  end
end
