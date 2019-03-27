require 'sinatra/base'

class Helpers

  def self.current_user(session[:user_id])
    @user_id = User.find_by_id(session[:user_id])
  end
current_user should accept the session hash as an argument. This method should use
the user_id from the session hash to find the user in the database and return that user.






  def self.is_logged_in?(session[:user_id])
    !!session[:user_id]
  end

end
