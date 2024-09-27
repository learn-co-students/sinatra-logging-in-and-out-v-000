class Helpers
  
  def self.current_user(session)
    if session.key?(:user_id)
      @user = User.find(session[:user_id])
      @user
    else
      nil
    end
  end
  
  def self.is_logged_in?(session)
    if self.current_user(session)
      session[:user_id]==self.current_user(session).id
    else
      nil
    end
   #binding.pry
  end
end