class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :password
      t.decimal :balance, :precision =>18, :scale => 2
    end
  end
end
