class Helpers

    def self.current_user(session)
        @user = User.find(session[:user_id])
    end

    def self.is_logged_in?(session)
        session.include?(:user_id)
        # !!session[:user_id]
    end
end

         # else
      #   # redirect to '/error'
      #no erb here, so is redirect (to) an erb method? Do I need the to?
      # params is whatever is entered by user that matches correct key?
 #so "else" was not necessary? is this generally possible?
