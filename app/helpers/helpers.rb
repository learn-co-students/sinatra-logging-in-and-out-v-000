class Helpers
  def self.current_user(session)
    @user = User.find_by_id(session[:user_id])
  end

#!! forced string into boolean context (true) and then negated (false), and then negated again (true)
  def self.is_logged_in?(session)
    !!(session[:user_id])
  end
end
