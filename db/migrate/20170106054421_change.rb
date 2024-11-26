class Change < ActiveRecord::Migration
  def change
        remove_column :users, :balance, :float
  end
end
