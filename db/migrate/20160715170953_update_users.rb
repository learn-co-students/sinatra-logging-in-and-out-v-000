class UpdateUsers < ActiveRecord::Migration
  def change
    change_column(:users, :balance, :decimal)
  end
end
