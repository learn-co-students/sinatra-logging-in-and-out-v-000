require 'sinatra/base'

class Helpers

  def self.current_user(session_hash)
    if session_hash[:user_id]
      @user = User.find(session_hash[:user_id])
    end
  end

  def self.is_logged_in?(session_hash)
    !!current_user(session_hash)
  end

end
