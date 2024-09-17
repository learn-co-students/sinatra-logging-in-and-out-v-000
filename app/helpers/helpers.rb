class Helpers

  def self.current_user(session_hash)
    user = User.find_by(id: session_hash[:user_id])
    user
  end

  def self.is_logged_in?(session_hash)
    !!current_user(session_hash)
  end

end
