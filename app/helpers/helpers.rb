class Helpers
   def self.current_user(sessionHash)
      User.find(sessionHash[:user_id])
   end

   def self.is_logged_in?(sessionHash)
      sessionHash[:user_id] ? true : false
   end
end
