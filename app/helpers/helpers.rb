require 'sinatra/base'

class Helpers

# finds user in database
  def self.current_user(session)
    @user = User.find_by_id(session[:user_id])
  end

# checks if user is logged in
  def self.is_logged_in?(session)
    !!session[:user_id]
  end

end
