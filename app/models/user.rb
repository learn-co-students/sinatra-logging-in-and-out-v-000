
class User < ActiveRecord::Base
  validates_presence_of :username, :password, :balance

  # def current_user
  #   @current_user
  # end

end
