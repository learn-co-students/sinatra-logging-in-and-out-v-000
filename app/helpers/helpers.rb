class Helpers
    def self.current_user(user) 
        @user = User.find(user[:user_id])
        @user
    end

    def self.is_logged_in?(session)
        !!session[:user_id]
    end

end