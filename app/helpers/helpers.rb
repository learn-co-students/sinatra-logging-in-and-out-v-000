class Helpers

  def current_user(session)
    user = User.find(session[:id])
  end

  def is_logged_in?(session)
    session[:id] != nil ? true : false
  end
  
end