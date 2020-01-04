class Helpers < Sinatra::Base
  
  def self.current_user(session)
    User.find_by(id: session[:user_id])
  end

  def self.is_logged_in?(session)
    !!session[:user_id] = self.current_user(session).id
  end
end


#def self.current_user(session)
    #@user = User.find_by(id: session[:user_id])
  #end

  #def self.is_logged_in?(session)
    #!!session[:user_id] = @user.id
  #end
#end