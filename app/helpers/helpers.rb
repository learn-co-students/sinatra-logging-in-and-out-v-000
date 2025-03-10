
class Helpers
  
  def self.current_user(session)
    current_user = User.find(session[:user_id])
    current_user
  end

  def self.is_logged_in?(session)
    if User.find(session[:user_id]) != nil
      true
    else
      false
    end
  end
end