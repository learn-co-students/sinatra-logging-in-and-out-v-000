
require 'pry'

class Helpers
  
  def current_user(session)
    binding.pry 
    User.find_by(username: session[:user_id]).username
  end 
  
  def is_logged_in?(session)
    
  end 
  
end