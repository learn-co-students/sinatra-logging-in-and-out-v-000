require 'pry'
class Helpers

  def self.current_user(session)
    user = User.find_by(id: session[:user_id])
  end

  def self.is_logged_in?(session)
    user = Helpers.current_user(session)
    result = nil
    if user != nil
      result = true
    else
      result = false
    end
    result
  end

end
