class Helpers
  def self.current_user(session)
    user = User.find(id: session[:user_id])
  end

  def self.is_logged_in?(session)
    if session[:user_id] != nil && User.find(id: session[:id])
      true
    else
      false
    end
  end
end
