class Helpers

  def self.current_user(session)
    id = session[:user_id]
    User.find(id)
  end

  def self.is_logged_in?(session)
    user_id = current_user(session).id
    session[:user_id] == user_id ? true : false
  end
end
