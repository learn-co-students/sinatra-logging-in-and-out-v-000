# These two methods will only ever be called in views, particularly account.erb, in order to add double protection to this view
# so that only the current user, when they are logged in, can see their bank account balance.
# It's important to note that helper methods can be used for a lot more than just tracking whether a user is logged in and who
# the current user is. Helpers are methods that make it cleaner to add logic to our views.


class Helpers

  def self.current_user(session)
    # binding.pry
    User.find_by_id(session[:user_id])
  end

  def self.is_logged_in?(session)
    session.include?(:user_id)
  end

end
