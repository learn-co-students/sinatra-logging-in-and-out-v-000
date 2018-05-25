class ChangeColumnValuePrecision < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :balance, :decimal, :precision => 15, :scale => 1
  end
end
