require 'spec_helper'

describe 'ApplicationController' do
  describe "GET '/'" do
    it "returns a 200 status code" do
      get '/'
      expect(last_response.status).to eq(200)
    end

    it "contains a form for a user to log in" do
      get '/'
      expect(last_response.body).to include("<input")
    end
  end

  describe "POST '/login'" do
    before do
      @user1 = User.create(:username => "skittles123", :password => "iluvskittles", :balance => 1000)
      @user2 = User.create(:username => "flatiron4lyfe", :password => "Rubie!", :balance => 500)
      @user3 = User.create(:username => "kittens1265", :password => "crazycatlady", :balance => 10000)
    end

    it "returns a 302 redirect status code" do
      params = {
        "username"=> "skittles123", "password" => "iluvskittles"
      }
      post '/login', params
      expect(last_response.status).to eq(302)
    end

    it "sets session[:user_id] equal to id of the user" do
      post '/login', {
        "username"=> "flatiron4lyfe", "password" => "Rubie!"
      }
      follow_redirect!
      expect(session[:user_id]).to eq(2)
    end

end

  describe "GET '/logout'" do
    it "clears the session" do
      get '/logout'
      expect(session[:user_id]).to be(nil)
    end

  end

end
