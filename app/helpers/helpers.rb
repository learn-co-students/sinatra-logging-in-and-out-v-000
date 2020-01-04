class Helpers
  def current_user(session)
    @user = User.find_by(id: session[:user_id])
  end

  def is_logged_in?(session)
    !!session[:user_id] = @user.id
  end
end