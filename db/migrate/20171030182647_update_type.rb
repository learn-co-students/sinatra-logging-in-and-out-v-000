class UpdateType < ActiveRecord::Migration
    def self.up
      change_column :users, :balance, :integer
    end
   
    def self.down
      change_column :users, :balance, :decimal
    end
end
