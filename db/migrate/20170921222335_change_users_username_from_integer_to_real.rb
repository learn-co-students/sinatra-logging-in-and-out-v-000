class ChangeUsersUsernameFromIntegerToReal < ActiveRecord::Migration
  def up
    change_column :users, :balance, :real
  end

  def down
    change_column :users, :balance, :integer
  end
end
