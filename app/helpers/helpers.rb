class Helpers
  
  def self.current_user(session_hash)
    User.find_by(session_hash[:id])
  end 
  
  def self.is_logged_in?(session_hash)
    session_hash[:user_id] != nil 
  end 
  
  
end