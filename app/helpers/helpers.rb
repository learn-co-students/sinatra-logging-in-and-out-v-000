class Helpers

  def current_user(session)
    @user = User.find(params[:id])
    session[:user_id] = @user.id
    @user
  end

  def is_logged_in?

  end
end
