class Helpers
  def self.current_user(session_hash)
    #binding.pry
    @user = User.find_by_id(session_hash[:user_id])
  end

  def self.is_logged_in?(session_hash)
    #binding.pry
    !!session_hash[:user_id]
  end
end
