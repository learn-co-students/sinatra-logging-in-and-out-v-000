require 'pry'
class Helpers
   def self.current_user(session)
    # binding.pry
     @user_id = User.find(session[:user_id])
     #binding.pry
     @user_id
   end

   def self.is_logged_in?(session)
     #binding.pry
     @user_id2 = User.find(session[:user_id])
     #binding.pry
     if @user_id2
       true
     else
       false
    end
   end
end
