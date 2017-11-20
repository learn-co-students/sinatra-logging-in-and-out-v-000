class Helpers

  def current_user(session)
    User.where(id == session[:id])
  end

  def is_logged_in?(session)
    !!session.include?(@user.id)
  end
end
