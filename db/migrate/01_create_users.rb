class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |b|
      b.string :username
      b.string :password
      b.decimal :balance
    end
  end
end
