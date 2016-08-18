class Helpers
  def self.current_user(session)
    # User.find(session[:user_id])
    @current_user ||= User.find(session[:id])
  end

  def self.is_logged_in?(session)
    !!self.current_user(session)
  end

end
