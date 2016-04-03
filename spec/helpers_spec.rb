describe "Helpers" do

  describe 'Helpers#current_user' do
    it "returns the current user" do
      @user1 = User.create(:username => "skittles123", :password => "iluvskittles", :balance => 1000)

      session = {
        "session_id"=>"40d7f05911859eec423c18b8ca92da192e772a8afe4d1afcec611ae16e483843",
        "csrf"=>"a8f2c70d597115645c1f97e8ddc6079c",
        "tracking"=> {
          "HTTP_USER_AGENT"=>"da39a3ee5e6b4b0d3255bfef95601890afd80709",
          "HTTP_ACCEPT_LANGUAGE"=>"da39a3ee5e6b4b0d3255bfef95601890afd80709"
          },
        "user_id" => 1
      }
      expect(Helpers.current_user(session)).to be_an_instance_of(User)
    end

  end

  describe 'Helpers#is_logged_in?' do
    it "returns the current user" do
      @user1 = User.create(:username => "skittles123", :password => "iluvskittles", :balance => 1000)

      session = {
        "session_id"=>"40d7f05911859eec423c18b8ca92da192e772a8afe4d1afcec611ae16e483843",
        "csrf"=>"a8f2c70d597115645c1f97e8ddc6079c",
        "tracking"=> {
          "HTTP_USER_AGENT"=>"da39a3ee5e6b4b0d3255bfef95601890afd80709",
          "HTTP_ACCEPT_LANGUAGE"=>"da39a3ee5e6b4b0d3255bfef95601890afd80709"
          },
        "user_id" => 1
      }
      expect(Helpers.is_logged_in?(session)).to eq(true)
    end

  end
end
