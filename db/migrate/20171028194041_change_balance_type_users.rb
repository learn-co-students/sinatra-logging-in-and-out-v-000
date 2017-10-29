class ChangeBalanceTypeUsers < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :balance, :real
  end
end
