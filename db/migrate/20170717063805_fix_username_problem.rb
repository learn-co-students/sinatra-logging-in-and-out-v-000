class FixUsernameProblem < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    remove_column :users, :name
  end
end
