class Helpers

    def self.current_user(session)
        User.find_by(id: session[:user_id])
    end

    def self.is_logged_in?(session)
        !!current_user(session)
        # if current_user(session) 
        #    return true
        # else
        #    return false
        # end
    end
end