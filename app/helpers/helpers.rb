class Helpers

  def Helpers.current_user(session)
    User.find_by(session[:user_id])
  end

  def Helpers.is_logged_in?(session)
      if session[:user_id]
        true
      else
       nil
      end
  end

end
