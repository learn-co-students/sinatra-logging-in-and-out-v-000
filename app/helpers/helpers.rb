class Helpers
  def self.current_user(session_hash)
    user = User.find_by(session_hash[:id])
    user
  end

  def self.is_logged_in?(session_hash)
    if !!self.current_user(session_hash)
      return true
    else
      return false
    end
  end
end
