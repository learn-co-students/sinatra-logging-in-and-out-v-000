
class Helpers

  def self.current_user(session)
<<<<<<< HEAD
    User.find(session[:user_id])
  end

  def self.is_logged_in?(session)
    !![:user_id]
=======
   @user = User.find_by_id(session[:user_id])
 end

  def self.is_logged_in?(session)
    !!session[:user_id]
>>>>>>> 9e36ad970499b1105e20adc25276212f4bcf48c8
  end
end
