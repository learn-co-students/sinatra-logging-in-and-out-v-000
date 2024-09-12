class Helpers
  def self.current_user(session)
    User.find(session[:user_id])
  end

  def self.is_logged_in?(session)
    !!session[:user_id]
  end

  def self.log_in(username, password, session)
    if user = User.find_by(username: username, password: password)
      session[:user_id] = user.id
    else
      false
    end
  end

  def self.log_out(session)
    session.clear
  end
end