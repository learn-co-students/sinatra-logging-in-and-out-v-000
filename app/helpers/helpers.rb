class Helpers

  def self.current_user(session_hash)
    @current_user = User.all.find(session_hash[:user_id])
    @current_user
  end

  def self.is_logged_in?(session_hash)
 !!session_hash[:user_id]
  end

end
