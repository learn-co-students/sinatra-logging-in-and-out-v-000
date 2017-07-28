require 'pry'
class Helpers

  def self.current_user(session)
    User.find(session[:user_id])
  end

  def self.is_logged_in?(session)
    if session[:user_id] == nil
      return false
    elsif User.find(session[:user_id]).id == session[:user_id]
      return true
    else
      return false
    end
  end

end
