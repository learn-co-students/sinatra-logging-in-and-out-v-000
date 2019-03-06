class Helpers
    def self.current_user(session)
        @user = User.find(session[:id])
    end

    def self.is_logged_in?(session)
        !!(session[:id])
    end
end