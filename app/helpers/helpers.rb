class Helpers

    def self.current_user(session)
        @user = User.find_by_id(session[:user_id])
      end
    
      def self.is_logged_in?(session)
        !!session[:user_id]
      end
end

#the two methods will only be called in views (account.erb) 
#helper methods make it cleaner to add logic to our views
