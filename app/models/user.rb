class User < ActiveRecord::Base
  attr_accessor :username, :password, :balance

  def initialize()
    # @username = username
    # @password = password
    # @balance = balance
  end

end
