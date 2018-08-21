class FixColumns < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :balance
    
  end
end
