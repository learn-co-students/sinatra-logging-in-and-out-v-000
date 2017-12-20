class User < ActiveRecord::Base
  validates_presence_of :username, :password, :balance  #reflects the columns in our databse
end


#note that the database is called users, but the class is user
