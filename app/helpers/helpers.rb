class Helpers
  def self.current_user(session)
    @id = session[:user_id]
    @user = User.find(@id)
  end

  def self.is_logged_in?(session)
    if session[:user_id] != nil
      true
    end
  end
end
