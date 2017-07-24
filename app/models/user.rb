#create a User class
class User < ActiveRecord::Base
#Users should have a username, password, and balance
 attr_accessor :id, :username, :password, :balance

 def initialize(id, username, password, balance)
   @id = id
   @username = username
   @password = password
   @balance = balance
 end
#create a User table to store users
 def self.create_table
   sql =  <<-SQL
     CREATE TABLE IF NOT EXISTS users (
       id INTEGER PRIMARY KEY,
       username TEXT,
       password TEXT,
       balance DECIMAL
       )
       SQL
   DB[:conn].execute(sql)
 end

end
