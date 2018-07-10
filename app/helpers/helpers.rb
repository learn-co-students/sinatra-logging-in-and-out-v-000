class Helpers
  def current_user(session)
    @user = User.find(params[:id])
    session[:id] = @user.id
    @user.id
  end

  def is_logged_in? 
  end
end