class Helpers

  def self.current_user(session_hash)
    User.find(session[:id])
  end

  def self.is_logged_in?(session_hash)
    if !!session[:id]
      true
    else
      false
    end

  end
end
