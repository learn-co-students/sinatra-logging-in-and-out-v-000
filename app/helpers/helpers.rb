class Helpers
  
  def self.current_user(session)
   
   @current =  User.find(session["user_id"])
   @current  
  end


  def self.is_logged_in?(session)
    if session["user_id"] != nil 
      true 
    else 
      false 
    end 
  end



end