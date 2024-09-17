class Helpers
  def self.current_user(session)
    #binding.pry
    @user = User.find_by(id: session[:user_id])
  end

  def self.is_logged_in?(session)
    if session[:user_id]
      true
    else
      false
    end 

  end
end
