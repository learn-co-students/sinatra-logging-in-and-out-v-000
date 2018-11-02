class Helpers

  def self.current_user(session)
    User.find_by(id: session[:user_id])
    #binding.pry
  end

  def self.is_logged_in?(session)
    if self.current_user(session)
      true
    end
  end
end
