class Helpers

  def current_user(session)
    @user = User.find_by(session[:id])
    @user
  end

  def is_logged_in?(session)
    @user = User.find_by(session[:id])
    @user.id == session[:id] ? true : false
  end
end
