require 'pry'
class Helpers

  def self.current_user(arg)
    #binding.pry
   @user = User.find(arg[:user_id])
  # binding.pry
  end

  def self.is_logged_in?(arg)
arg[:user_id]==nil ? false : true
  end
end
