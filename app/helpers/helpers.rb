class Helpers

    def self.current_user(session)
        @user = User.find_by(session[:user_id])
    end

    # How does class Helpers have access to @user?

    def self.is_logged_in?(session)
        session.include?(:user_id)
        # !!session[:user_id]
    end
end