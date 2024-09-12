require 'sinatra/base'

class Helpers

  def self.current_user(session)
    User.find_by_id(session[:user_id])
  end

  def self.is_logged_in?(session)
    if session.include?(:user_id)
      true
    else
      false
    end
  end
end
