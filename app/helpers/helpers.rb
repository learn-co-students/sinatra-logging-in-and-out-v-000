class Helpers

  def self.current_user(session_hash)
    User.find(session_hash[:user_id])
  end

  def self.is_logged_in?(session_hash)
    session_hash.key?(:user_id)
    #want this to return true of false
  end

end
