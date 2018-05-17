class User < ActiveRecord::Base
    
    attr_accessor :username, :password, :balance

    def initialize(username, password, balance)
        @username = username
        @password = password
        @balance = balance
    end

end
