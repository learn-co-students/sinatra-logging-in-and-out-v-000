class Helpers

  def current_user(session)
    @user = User.find_by(session[user_id])
    @user
  end

  def is_logged_in?(session)
    !session[user_id]
  end

end
