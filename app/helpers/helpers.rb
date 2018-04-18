class Helpers
  def self.current_user(session)
    User.find_by(session[:id])
  end

  def self.is_logged_in?(session)
    !!self.current_user(session)
  end
end
