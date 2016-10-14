class Helpers

  def current_user(session)
    return User.find(session[:user_id])
    binding.pry
  end

  def is_logged_in?(session)
    session.include?(user_id)
  end

end
