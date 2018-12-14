class Helpers
  def current_user(session)
      @user=User.find_by(username: params[:username], password: params[:password])
    if

  end

  def is_logged_in?(session)
    !!session.user_id ? true : false
      true
  end

end
