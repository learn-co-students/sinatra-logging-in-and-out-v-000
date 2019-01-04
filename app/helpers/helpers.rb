require 'pry'

class Helpers
  
  def self.current_user(session)
    user_id = session[:user_id]
    current_user = User.find_by id: user_id
    current_user
  end
  
  def self.is_logged_in?(session)
    if session.include?(:user_id)
      true 
    else 
      false 
    end 
  end
end