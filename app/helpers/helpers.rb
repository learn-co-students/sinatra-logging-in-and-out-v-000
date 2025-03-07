class Helpers

  def self.current_user(session)
    return User.find(session[:user_id])
  end

  def self.is_logged_in?(session)
    return !!User.find(session[:user_id])
  end

end
