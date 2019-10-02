class Helpers
  
  def self.current_user(session)
    if session[:user_id] != nil 
      User.find(session[:user_id])
    end 
  end 
  
  def self.is_logged_in?(session)
    #binding.pry
    Helpers.current_user(session) ? true : false
  end 
end