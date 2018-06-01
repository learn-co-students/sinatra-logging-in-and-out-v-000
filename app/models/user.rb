class User < ActiveRecord::Base
  attr_reader :name, :password
  attr_accessor :balance
end
