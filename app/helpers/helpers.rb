require 'sinatra/base'

class Helpers

  def self.current_user(session)
    num = session[:user_id]
    @user = User.find_by_id(num)
  end

  def self.is_logged_in?(session)
    !!session[:user_id]
  end
end
