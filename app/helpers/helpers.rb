class Helpers

  def current_user(session)
    @user = User.find_by(user_id: session[:user_id])
    @user
  end
end
