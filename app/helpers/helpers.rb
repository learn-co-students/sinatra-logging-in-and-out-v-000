class Helpers
  def self.current_user(session)
    User.find(session[:user_id]) if session[:user_id]
  end
  def self.is_logged_in?(session)
    if session[:user_id] = User.find(session[:user_id])
      return true
    else
      return false
    end
  end
end
