class Helpers

  def current_user(session)
    @current_user = User.find_by(id: session[:user_id])
    binding.pry
    @current_user
  end
end
