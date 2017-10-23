class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
    change_table :users do |t|
      t.rename :email, :username 
    end
  end
end
