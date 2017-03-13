class Helpers
    
    def self.current_user(session)
#        binding.pry
        id = session[:user_id]
        User.find(id)
    end
    
    def self.is_logged_in?(session)
        !!session[:user_id]
    end
end