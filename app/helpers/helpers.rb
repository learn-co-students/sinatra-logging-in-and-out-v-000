class Helpers
  
  def current_user (session_hash)
    Users.find (session_hash[:user_id]
  end 

  def is_logged_in? (session_hash)
    !! session_hash.[:user_id] 
  end

end
