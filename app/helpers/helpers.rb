class Helpers

def self.current_user(session)
User.find(session[:user_id])
end#eom


def self.is_logged_in?(session)
!!session[:user_id]
end



end#eoc