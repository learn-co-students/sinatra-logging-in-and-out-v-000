require 'pry'

class Helpers

  def self.current_user(session) #uses the `user_id` from the session hash to find the user in the database and return that user.
    @user = User.find(session[:user_id])
  end

  def self.is_logged_in?(session) #return true if the `user_id` is in the session hash and false if not
    !!session[:user_id]
  end
end
