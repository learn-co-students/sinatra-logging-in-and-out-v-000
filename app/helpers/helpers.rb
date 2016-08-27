
class Helpers < User
    def self.current_user(session)
      User.find_by(session[:user_id])
    end

    def self.islogged_in?
    end
end
