class Helpers
    def self.current_user(session)
        user = User.find(session[:user_id])
        user
    end
    
    def self.is_logged_in?(session)
        puts "SESSION*************************"
        puts session
        session[:user_id] ? true : false
    end
end