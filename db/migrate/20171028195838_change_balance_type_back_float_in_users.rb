class ChangeBalanceTypeBackFloatInUsers < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :balance, :float, :precision => 4
  end
end
