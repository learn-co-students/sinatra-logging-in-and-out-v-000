class ChangeBalanceToBeDecimalInUsers < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :balance, :decimal
  end
end
