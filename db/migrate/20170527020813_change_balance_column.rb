class ChangeBalanceColumn < ActiveRecord::Migration
  def change
  	change_column :users, :balance, :float
  end
end
