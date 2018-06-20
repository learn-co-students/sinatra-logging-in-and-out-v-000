class Helpers
  
  def self.current_user(session)
    @user = session[:id]
    @user
  end
  
  def self.is_logged_in?(session)
    if @user.id == session[:id]
      true 
    else 
      false 
    end
  end
  
end