require 'sinatra/base'

class Helpers

  def self.current_user(session)
    @user = User.find_by_id(session[:user_id])
    @user
  end

  def self.is_logged_in?(session)
    self.current_user(session) != nil
  end
end
