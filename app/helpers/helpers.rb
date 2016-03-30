class Helpers

  def self.current_user(session)
    x = User.find(session[:user_id])
    x
  end

  def self.is_logged_in?(session)
    !!session[:user_id]
  end

end