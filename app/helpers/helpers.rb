class Helpers

  def self.current_user
    User.find(session[:id])

  end

  def self.is_logged_in?

  end

end
