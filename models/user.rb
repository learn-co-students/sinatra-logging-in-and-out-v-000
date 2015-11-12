require 'pry'

class User
  attr_accessor :username, :password
  attr_reader :bank_activity, :balance

  def initialize(initial_balance)
    @balance = initial_balance
    @bank_activity = [initial_balance]
  end

  def deposit(amount)
    bank_activity << amount
  end

  def withdraw(amount)
    bank_activity << -amount
  end

  def balance
    @balance = bank_activity.inject(:+)
  end


end
