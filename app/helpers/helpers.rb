class Helpers

  def self.current_user(session)
    User.find_by_id(session[:user_id])
  end

  def self.is_logged_in?(session) #? implies boolean return
    !!session[:user_id]  #! == opposite vs !! == boolean (forced)
  end

end
