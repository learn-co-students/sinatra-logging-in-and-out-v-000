class Helpers
  def self.current_user(session)
    User.find_by(id: session[:user_id])
    User.find_by_id(session[:user_id])
  end

  def self.is_logged_in?(session)
    !!User.find_by(id: session[:user_id])
    !!session[:user_id]
  end

end
