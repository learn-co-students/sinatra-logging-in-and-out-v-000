class Helpers
  def self.current_user(session)
    # binding.pry
    @user = User.find_by(session[:user_id])
  end

  def self.is_logged_in?(session)
    # binding.pry
    if session[:user_id] != nil
      return true
    else
      return false
    end
  end
end
