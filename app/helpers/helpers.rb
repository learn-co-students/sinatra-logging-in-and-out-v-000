class Helpers

  def self.current_user(session)
     # the session is {:user_id=>1}
    User.find(session[:user_id])
  end

  def self.is_logged_in?(session)
    return true if self.current_user(session)
    false
  end



end