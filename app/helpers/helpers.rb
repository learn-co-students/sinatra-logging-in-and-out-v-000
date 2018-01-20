require 'pry'
class Helpers

  def self.current_user(session)
      user = User.all.find(session[:user_id])
      user
  end

  def self.is_logged_in?(session)
    if session.include?(:user_id)
      return true
    else
      return false
    end
  end

end
