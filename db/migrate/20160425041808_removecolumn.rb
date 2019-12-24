class Removecolumn < ActiveRecord::Migration
  def change
    remove_column :users, :balance, :integer
    add_column :users, :balance, :decimal
  end
end
