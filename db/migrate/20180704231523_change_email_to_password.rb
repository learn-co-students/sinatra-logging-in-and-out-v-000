class ChangeEmailToPassword < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :email, :password
  end
end
