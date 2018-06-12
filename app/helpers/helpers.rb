class Helpers

  def current_user(sessions)
    @user = User.find_by_id(sessions[:user_id])
  end

  def is_logged_in?(sessions)
    !!session[:user_id] #a double bang returns either true or false
  end
end
