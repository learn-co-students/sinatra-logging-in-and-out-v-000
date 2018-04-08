class Helpers < Sinatra::Base
  def self.current_user(session)
    @user = User.find_by(id:session[:user_id])
  end

  def self.is_logged_in?(session)
    if self.current_user(session)
      true
    else
      false
    end
  end
end
