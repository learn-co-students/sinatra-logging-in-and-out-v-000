class Helpers

  def self.current_user(session = {})
    @user = User.find_by(session[:user_id])
    @user


    # it "returns the current user" do
    #   @user1 = User.create(:username => "skittles123", :password => "iluvskittles", :balance => 1000)
    #
    #   session = {
    #     :user_id => 1
    #   }
    #   expect(Helpers.current_user(session)).to be_an_instance_of(User)
    # end

  end

  def self.is_logged_in?(session = {})
    !!session[:user_id]
  end

end
