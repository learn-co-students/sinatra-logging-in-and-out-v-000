class Helpers

  def current_user(session_hash)
    User.find(session_hash[:user_id])
  end

  def is_logged_in?(session_hash)
    if session_hash[:user_id]
      return true
    end
    false
  end

end
