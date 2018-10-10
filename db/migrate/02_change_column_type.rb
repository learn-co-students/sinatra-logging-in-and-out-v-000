class ChangeColumnType < ActiveRecord::Migration[4.2]
 def change
   change_column :users, :balance, :float
 end

end
