class Helpers

  def self.current_user(session_hash)
    @user = User.find_by(id: session_hash[:user_id])
  end

  def self.is_logged_in?(session_hash)
    User.find_by(id: session_hash[:user_id]) != nil
  end
end
