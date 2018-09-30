require 'pry'
	
class Helpers < ActiveRecord::Base
  validates_presence_of :username, :password, :balance
   def self.current_user(session)
    @user = User.find_by(id: session[:user_id])
    @user
  end
   def self.is_logged_in?(session)
    #binding.pry
    if !!User.find_by(id: session[:user_id])
      true
    else
      false
    end
  end
 end