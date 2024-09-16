class RenameColumnPassordToPassword < ActiveRecord::Migration[4.2]

  rename_column :users, :passord, :password
  
end