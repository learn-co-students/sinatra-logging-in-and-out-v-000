class Helpers

  def self.current_user(session)
    User.all.find_by(id: session[:user_id])
  end

  def self.is_logged_in?(session)
    if session[:user_id]
      return true
    else
      return false
    end
  end
end
