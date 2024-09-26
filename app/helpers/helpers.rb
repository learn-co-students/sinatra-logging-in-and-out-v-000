class Helpers
  def self.current_user(session_hash)
    User.find(session_hash[:user_id])
    # I get an ActiveRecord::RecordNotFound error if session_hash[:user_id] is nil, so be careful!
  end 
  
  def self.is_logged_in?(session_hash)
    !!session_hash[:user_id]
  end
end