class Helpers
  def self.current_user(session)
    @user = User.find_by(:id => session[:user_id])
  end

  def self.is_logged_in?(session)
    if session[:user_id] != nil
      true
    else
      false
    end
  end
end
