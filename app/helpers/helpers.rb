class Helpers
  def current_user(session)
    @user = User.find_by(id: session[:id])
    @user
  end

  def is_logged_in?(session)
    !!session[:id]
  end
end
