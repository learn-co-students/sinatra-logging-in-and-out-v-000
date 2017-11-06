class AddUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :balance, :float
  end
end
