require 'pry'

class User < ActiveRecord::Base
  # binding.pry
  validates_presence_of :username, :password, :balance
end
