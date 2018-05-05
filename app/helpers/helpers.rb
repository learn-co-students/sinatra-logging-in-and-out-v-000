class Helpers
  def self.current_user(current_session)
    User.find(current_session[:user_id])
  end
  
  def self.is_logged_in?(current_session)
    !!current_session[:user_id]
  end
end
