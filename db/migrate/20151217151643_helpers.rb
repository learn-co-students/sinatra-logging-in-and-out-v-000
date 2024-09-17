class Helpers < ActiveRecord::Migration
  def change
    create_table :helpers do |t|
      t.string :username
      t.string :password
      t.float :balance
    end
  end
end
