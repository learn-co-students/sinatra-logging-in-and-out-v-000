require 'pry'
class Helpers

  def self.current_user(session)

    # binding.pry
    # @user = User.create(username: params["username"], password: params["password"], balance: params["balance"])
    # session = session[:id]
    @user = User.find_by_id(session[:user_id])
      # session[:user_id] = @user.id

    #binding.pry
    # @user = User.create(username: params["username"], password: params["password"], balance: params["balance"])
    # session = session[:id]
    # @user = User.find_by_id(session[:id])
    #   session[:id] = @user.id

      # @user
end

def self.is_logged_in?(session)

  !!session[:user_id]
# binding.pry

end
end
