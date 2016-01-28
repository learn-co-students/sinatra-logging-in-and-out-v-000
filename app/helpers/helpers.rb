require_relative '../models/user.rb'
require 'pry'

class Helpers 
  def self.current_user(session)
    #binding.pry
    @user = User.find(session["user_id"])
    return @user
  end
  
  def self.is_logged_in?(session)
    #binding.pry
    @user = User.find(session["user_id"])
    @user != nil ? true : false
  end
end