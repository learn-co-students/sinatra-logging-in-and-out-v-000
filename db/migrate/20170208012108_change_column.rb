class ChangeColumn < ActiveRecord::Migration
  def change
  	change_table :users do |t|
  		t.change :balance, :float
  	end
  end
end
