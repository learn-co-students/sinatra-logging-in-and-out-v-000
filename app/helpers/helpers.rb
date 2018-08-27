class Helpers
  def current_user(params)
    @user = User.find_by(user_id: params["user_id"])
  end

  def is_logged_in?

  end

end
