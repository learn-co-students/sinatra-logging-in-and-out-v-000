class Helpers 
  
  def self.current_user(session)
    @user = User.find_by_id(session[:user_id])
    @user 
  end 
  
  def self.is_logged_in?(session)
    
    if session[:user_id] != nil 
      return true 
    end 
  end 
end