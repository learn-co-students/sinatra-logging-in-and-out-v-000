class Helpers
  def self.current_user(session)
    #if !!session[:user_id]
    User.find(session[:user_id])
    #end
  end

  def self.is_logged_in?(session)
    !!session[:user_id]
  end
end
