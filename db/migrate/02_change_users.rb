class ChangeUsers < ActiveRecord::Migration[4.2]
  def change
    change_table :users do |t|
      t.remove :name
      t.remove :email
      t.string :username
      t.decimal :balance
    end
  end
end
