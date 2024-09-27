class Helpers

    def self.current_user(session)
        @user = User.find_by_id(session[:user_id])
       # @user = User.create(:username => )
    end
    
    def self.is_logged_in?(session)
        !!User.find_by_id(session[:user_id])
    end
end