class Helpers

    def self.current_user
        binding.pry
        @user = User.find(session[:id])
    end

    def self.logged_in?
        binding.pry
        if current_user.id == session[:id]
            true
        else
            false
        end
    end
end
