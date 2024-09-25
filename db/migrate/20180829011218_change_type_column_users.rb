class ChangeTypeColumnUsers < ActiveRecord::Migration[5.1]
  def change
     change_table :users do |t|
        t.change :balance, :decimal
     end
  end
end
