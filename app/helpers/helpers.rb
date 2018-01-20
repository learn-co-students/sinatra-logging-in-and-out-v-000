require 'pry'
class Helpers

  def self.current_user(session)
    session.collect do |key, value|
      User.all.find(value)
    end
  end

  def self.is_logged_in?(session)
    if session.include?(:user_id)
      return true
    else
      return false
    end
  end

end
