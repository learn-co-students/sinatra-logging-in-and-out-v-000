class Helpers

  def self.current_user(session)
    User.find(session[:user_id])
  end

  def self.is_logged_in?(session)
    if self.current_user(session).is_a?(User)
      true
    else
      false
    end
  end


end
