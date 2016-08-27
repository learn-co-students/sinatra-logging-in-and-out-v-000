
class Helpers < User
    def self.current_user(session)
      User.find_by(session[:user_id])
    end

    def self.is_logged_in?(session)
      if session.include?(:user_id)
        true
      else
        false
      end
    end

end
