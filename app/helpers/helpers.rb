class Helpers
  def self.current_user(session)
    session[:user_id].nil? ? nil : User.find(session[:user_id])
  end

  def self.is_logged_in?(session)
    self.current_user(session).nil? ? false : true
  end
end