class Changegcolumntype < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :balance, :integer
  end
end
