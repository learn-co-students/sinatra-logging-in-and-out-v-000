class Helpers

  def current_user(session)
    @user = User.find_by(id: session[:user_id])
    @user
  end
end
