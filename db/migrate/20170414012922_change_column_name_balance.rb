class ChangeColumnNameBalance < ActiveRecord::Migration
  def change
    rename_column :users, :account_balance, :balance
  end
end
