class Helpers
  #these class methods can only be called in account.erb
  def self.current_user(session)
    #binding.pry
    User.find(session[:user_id])
  end

  def self.is_logged_in?(session)
    #binding.pry
    if session[:user_id]
      true
    else
      false
    end
    # if User.find(session[:user_id]) != nil
    #   return true
    # else
    #   return false
    # end
  end
end
