class Helpers

  def self.current_user(session)
  #binding.pry
    User.find(session[:user_id])
  end

  def self.is_logged_in?(session)
    if session[:user_id]
      true
    end
  end

end
