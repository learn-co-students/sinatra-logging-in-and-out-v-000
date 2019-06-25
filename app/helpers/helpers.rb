class Helpers
    def self.current_user(args)
        user = User.find(args[:user_id])
    end

    def self.is_logged_in?(args)
        # Return true if user_id is in session_hash
        # Return false if not

        true if args[:user_id]

    end

end