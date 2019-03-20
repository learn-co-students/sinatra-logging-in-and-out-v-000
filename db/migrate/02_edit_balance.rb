class EditBalance < ActiveRecord::Migration[4.2]

#  def change
#    create_table :users do |t|
#      t.string :username
#      t.string :password
#      t.integer :balance
#    end
#  end

def change
      change_column(:users, :balance, :float)
  end #ends method

end
