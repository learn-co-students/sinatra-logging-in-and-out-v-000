class Users < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string  :email
      t.string  :password
      t.decimal :balance
    end
  end
end
