class Helpers

  def self.current_user(session)
    @user = User.find_by(id: session[:user_id])
    # binding.pry
#     [1] pry(Helpers)> @user
# => #<User:0x000000040de5b8
#  id: 1,
#  username: "skittles123",
#  password: "iluvskittles",
#  balance: #<BigDecimal:1d6b310,'0.1E4',9(27)>>
# binding.pry
# [1] pry(Helpers)> session
# => {:user_id=>1, :username=>"skittles123", :password=>"iluvskittles"}
  end

  def self.is_logged_in?(session)
    @user = User.find_by(id: session[:user_id])
    !!@user
    # binding.pry
    #  id: 1,
 # username: "skittles123",
 # password: "iluvskittles",
 # balance: #<BigDecimal:1802478,'0.1E4',9(27)>>
#  [2] pry(Helpers)> !!@user
# => true
  end
end
