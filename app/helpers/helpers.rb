class Helpers
  def current_user(session)
    user = User.find(id: session[:user_id])
  end

  def is_logged_in?(session)
    if session[:user_id] != nil && User.find(id: session[:id])
      true
    else
      false
    end
  end
end