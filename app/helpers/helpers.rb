class Helpers
  
  def current_user(session)
    user_id = session[:user_id]
    current_user = User.find_by id: user_id
    current_user
  end
  
  def is_logged_in?(session)
    if session.contains?(:user_id)
      true 
    else 
      false 
    end 
  end
end