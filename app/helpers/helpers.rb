class Helpers

  def self.current_user(session)
    @current_user = User.find_by_id(session[:user_id])
  end

  def self.is_logged_in?(session)
    !!session[:user_id] #=> If you double-negate it, it forces the boolean context, but returns the proper boolean value.
  end
end
