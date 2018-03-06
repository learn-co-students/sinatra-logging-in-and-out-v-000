class Helpers
  def self.current_user(session)
      User.find_by(id: session[:user_id])
  end

  def self.is_logged_in?(session)#return true if the user_id is in the session hash and false if not
    session.has_key?(:user_id)
  end

end
