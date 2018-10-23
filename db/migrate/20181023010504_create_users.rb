class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |x|
      x.text :username
      x.text :password
      x.integer :balance
    end
  end
end
