class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |u|
      u.string :username
      u.string :password
      u.decimal :balance  #decimal is an ActiveRecord datatype (so is string)
    end

  end
end

#note that the name of the table is users, the class in the module will be called user
