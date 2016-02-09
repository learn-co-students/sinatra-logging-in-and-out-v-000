require 'pry'
class Helpers

  def self.current_user(session)
   @current_user = User.find(session['user_id'])
 
  end

  def self.is_logged_in?(session)
    !!@current_user
  end
end