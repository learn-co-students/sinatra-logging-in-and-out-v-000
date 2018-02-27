class AlterColumnPrecision < ActiveRecord::Migration
  def change
  	change_column :users, :balance, :decimal, :precision => 15, :scale => 2
  end
end
