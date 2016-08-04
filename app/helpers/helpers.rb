class Helpers

  def self.current_user(session: session)
    @user = User.find_by(id: session[:user_id])
  end

  def self.is_logged_in?(session: session)
    if session[:user_id]
      true
    else
      false
    end
  end
  
end
