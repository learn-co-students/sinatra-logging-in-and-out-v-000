class Users < ActiveRecord::Migration
  def change
    create_table :users do |x|
      x.string :username
      x.string :password
      x.float :balance
    end
  end
end
