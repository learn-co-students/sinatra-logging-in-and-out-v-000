require 'sinatra/base'

class Helpers

    def self.current_user(session) #class method, meaning operates on the class itself, not an instance. Thereofre you don't do Helpers.new.current_user, but rather Helpers.current_user
        @user = User.find_by(:id => session[:user_id])
    end 

    def self.is_logged_in?(session)
        !!session[:user_id]
    end 

end