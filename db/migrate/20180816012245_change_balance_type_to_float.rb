class ChangeBalanceTypeToFloat < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :balance, :float
  end
end
