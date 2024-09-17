# Helpers Class
class Helpers
  def self.is_logged_in?(session)
    return false if User.find(session[:user_id]).nil?
    true
  end

  def self.current_user(session)
    user = User.find(session[:user_id])
    user
  end
end
