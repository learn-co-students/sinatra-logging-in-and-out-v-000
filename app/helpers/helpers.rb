class Helpers
  def self.current_user(session_hash) #the test for this uses user_id instead of id.  uses it as a string, but other test uses it as a symbol
    # binding.pry
    User.find(session_hash["user_id"])
  end

  def self.is_logged_in?(session_hash)
    !!session_hash["user_id"]
  end
end