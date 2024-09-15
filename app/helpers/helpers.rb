class Helpers
  class << self
    def current_user(session)
      User.find(session[:user_id])
    end

    def is_logged_in?(session)
      !!session[:user_id]
    end
  end
end
