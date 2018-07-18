class Helpers

  def self.current_user(session)
    user = User.all.where{ |u| u.id == session[:user_id]}
    user
  end

  def is_logged_in?
  end
end
