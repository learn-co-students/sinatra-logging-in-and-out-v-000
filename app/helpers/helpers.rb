class Helpers

  def self.current_user(session)
    user = User.find_by_id(session[:user_id])
  end

  def self.is_logged_in?(session)
    # binding.pry
    user = User.find_by_id(session[:user_id])
     user.id == session[:user_id]
     # if user
    #   true
    # else
    #   false
    # end
  end



end
