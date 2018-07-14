require 'pry'
class User < ActiveRecord::Base
  attr_accessor :username, :password, :balance

  binding.pry
end
