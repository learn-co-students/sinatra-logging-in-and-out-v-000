class User

 attr_accessor :id, :username, :password, :balance

 def initialize(id, username, password, balance)
   @id = id
   @username = username
   @password = password
   @balance = balance
 end

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
