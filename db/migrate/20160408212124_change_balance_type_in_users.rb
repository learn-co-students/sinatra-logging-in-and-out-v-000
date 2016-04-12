class ChangeBalanceTypeInUsers < ActiveRecord::Migration
  def self.up 
  	change_column :users, :balance, :float
  end

  def self.down
  	change_column :users, :balance, :decimal
  end
end
