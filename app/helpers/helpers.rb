class Helpers

  def self.current_user(session)
    User.find_by(id: session[:user_id])
  end
  # how to integrate your helper methods into controller
  def self.is_logged_in?(session)
    session != nil ? true : false
  end

end