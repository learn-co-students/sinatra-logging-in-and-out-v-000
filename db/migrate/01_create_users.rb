class CreateUsers < ActiveRecord::Migration[4.2]

  def change
    create_table :users do |u|
      u.string :username
      u.string :password
      u.float :balance
    end
  end

end
