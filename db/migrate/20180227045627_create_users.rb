class CreateUsers < ActiveRecord::Migration
  def change
  	create_table :users do |t|
  		t.string :username
  		t.decimal :balance, default: nil, precision: 2, scale: 2
  		t.string :password
  	end
  end
end
