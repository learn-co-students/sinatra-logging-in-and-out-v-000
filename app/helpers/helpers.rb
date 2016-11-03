require "pry"
class Helpers
  def self.current_user(session)
     User.find(session[:user_id])
  end

  def self.is_logged_in?(session)
    current_user(session).nil? ? nil : !!current_user(session).id

  end
end
