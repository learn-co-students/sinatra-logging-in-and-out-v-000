require_relative '../../config/environment'

class Helpers

  def self.current_user(session)
    @user = session[:user_id] == nil ? nil : User.find(session[:user_id])
  end

  def self.is_logged_in?(session)
    self.current_user(session) != nil
  end

end