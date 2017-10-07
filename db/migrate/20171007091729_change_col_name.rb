class ChangeColName < ActiveRecord::Migration
  def change
    rename_column :users, :user, :username
  end
end
