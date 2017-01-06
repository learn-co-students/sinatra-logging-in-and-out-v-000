class Helpers

  def self.current_user(session)
    @user = User.find_by(id: session[:user_id])
    @user
  end

  def self.is_logged_in?(session)
    session.has_key?(:user_id)
    # s!!current_user(session)
    # !! is just ! (the boolean negation operator) written twice. It will negate the argument, then negate the negation. It's useful because you can use it to get a boolean from any value. The first ! will convert the argument to a boolean, e.g. true if it's nil or false, and false otherwise. The second will negate that again so that you get the boolean value of the argument, false for nil or false, true for just about everything else.
  end
end
