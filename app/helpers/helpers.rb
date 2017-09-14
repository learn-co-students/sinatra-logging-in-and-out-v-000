class Helpers
  def self.current_user(session)
    User.find_by(id: session[:user_id])
  end

  def self.is_logged_in?(session)
    if !!self.current_user(session)
      session[:user_id] == self.current_user(session).id
    else
      false
    end
  end
end
