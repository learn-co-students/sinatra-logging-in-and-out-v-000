class Helpers
	def self.current_user(sess)
		uid = sess[:user_id]
		user = User.find_by(id: uid)
		user
	end
	
	def self.is_logged_in?(sess)
		!!sess[:user_id]
	end

end
