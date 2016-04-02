require 'pry'

class Helpers
  def self.current_user(session)
    @current_user = User.find_by(id: session[:user_id])  
  end

  # !!:
  # returns true if the object on the right is not nil and not false, false if it is nil or false
  
  def self.is_logged_in?(session)
    !!@current_user
  end
end