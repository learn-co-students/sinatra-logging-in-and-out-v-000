class Helpers
  #these class methods can only be called in account.erb
  def self.current_user(session)
    #binding.pry
    User.find(session[:user_id])
  end

  def self.is_logged_in?(session)
    if User.find(session[:user_id]) != nil
      return true
    else
      return false
    end
  end
end
