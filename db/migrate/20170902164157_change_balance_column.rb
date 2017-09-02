class ChangeBalanceColumn < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.change :balance, :decimal
    end
  end
end
