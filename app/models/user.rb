class User < ActiveRecord::Base
  validates_presence_of :name, :password, :balance
end
