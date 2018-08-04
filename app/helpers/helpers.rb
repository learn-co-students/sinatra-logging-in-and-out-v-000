class Helpers

  def self.current_user(session)
    @user = User.find_by(id: session[:user_id])
    # binding.pry
    # [1] pry(Helpers)> @user
    # => #<User:0x007fdc435b6e50 id: 1, username: "skittles123", password: "iluvskittles", balance: #<BigDecimal:7fdc4329fe60,'0.1E4',9(27)>>
    # [2] pry(Helpers)> session
    # => {:user_id=>1}
  end

  def self.is_logged_in?(session)
    @user = User.find_by(id: session[:user_id])
    !!@user
#     binding.pry
#     [1] pry(Helpers)> @user
# => #<User:0x007fb8e4a83690 id: 1, username: "skittles123", password: "iluvskittles", balance: #<BigDecimal:7fb8e3824d50,'0.1E4',9(27)>>
# [2] pry(Helpers)> !!@user
# => true
  end
end
