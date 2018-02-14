require 'pry'
class Helpers

  def self.current_user(session_hash)
    @current_user = User.find(session_hash[:user_id])
  end

  def self.is_logged_in?(session_hash)
    !!session_hash[:user_id]
  end
end
