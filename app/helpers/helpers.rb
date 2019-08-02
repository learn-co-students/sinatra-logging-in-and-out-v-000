class Helpers
  def self.current_user(session)
    id = session[:user_id]
    User.find_by_id(id)
  end

  def self.is_logged_in?(session)
    !!session[:user_id]
  end
end
