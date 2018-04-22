class UpdateCreateUsers < ActiveRecord::Migration[5.1]
  def change
    rename_table :User, :users

  end
end
