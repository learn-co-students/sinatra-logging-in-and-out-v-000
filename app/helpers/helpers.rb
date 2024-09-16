class Helpers

  def self.current_user(session) #use user_id from session hash to find and return user in database
    @user = User.find_by_id(session[:user_id])
  end

  def self.is_logged_in?(session)
    if session[:user_id]
      return true
    elsif !!session[:user_id]
      return false
    end
  end
end
