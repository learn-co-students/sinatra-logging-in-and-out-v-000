class Helpers

  def self.current_user(session)
    session = User.find_by_id(session[:user_id])
  end

  def self.is_logged_in?(session)
    session = true
  end

end