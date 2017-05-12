require 'pry'
class Helpers < User

  def self.current_user(session)
    id = session[:user_id]
    @user = User.find(id)
    return @user
  end

  def self.is_logged_in?(session)
    if session == nil
      return false
    else
      return true
    end
  end
end
