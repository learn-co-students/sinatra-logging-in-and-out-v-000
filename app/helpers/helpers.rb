class Helpers
  def self.current_user(session)
    User.find(session[:user_id]) unless session[:user_id].nil?
  end

  def self.is_logged_in?(session)
    !!self.current_user(session)
  end
end
