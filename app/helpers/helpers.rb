class Helpers

  def self.current_user(session_hash)
    @current_user = User.find_by_id(session_hash[:user_id])
    @current_user
  end

  def self.is_logged_in?(session_hash)
    !!session_hash.include?(:user_id)
  end

end
