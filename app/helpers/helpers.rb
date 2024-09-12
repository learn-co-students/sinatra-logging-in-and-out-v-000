class Helpers

  def self.user_exist?(username)
    user = User.find_by(username: username)
    if user
      user
    else
      false
    end
  end

  def self.current_user(session)
    User.find(session[:user_id])
  end

  def self.is_logged_in?(session)
    !!session[:user_id]
  end
end
