require 'spec_helper'

describe 'App' do
  describe "GET '/'" do
    it "returns a 200 status code" do
      get '/'
      expect(last_response.status).to eq(200)
    end
  end

  describe "POST '/login'" do

    it "returns a 302 redirect status code" do
      post '/login', {
        "username"=> "jdorchen", "password" => "elephant"
      }
      expect(last_response.status).to eq(302)
    end

    it "sets session[:user_id] equal to id of the user" do
      post '/login', {
        "username"=> "mcaulfield", "password" => "sneaky12"
      }
      follow_redirect!
      expect(session[:user_id]).to eq(2)
    end

    it "displays the correct username based on session[:user_id]" do
      post '/login', {
        "username"=> "dbaron", "password" => "test123"
      }
      follow_redirect!
      expect(last_response.body).to include('Welcome dbaron')
    end

    it "displays the correct balance based on session[:user_id]" do
      post '/login', {
        "username"=> "dbaron", "password" => "test123"
      }
      follow_redirect!
      expect(last_response.body).to include('100')
    end

    it "displays a 'Log Out' link" do
      post '/login', {
        "username"=> "dbaron", "password" => "test123"
      }
      follow_redirect!
      expect(last_response.body).to include('Log Out')
    end


    it "shows the error page if username and ID do not match available users" do
      post '/login', {
        "username"=> "joe", "password" => "nopassword"
      }
      expect(last_response.body).to include('You Must <a href="/">Log In</a> to View Your Balance')
    end
  end

  describe "GET '/account'" do
    it "shows the error page if user goes directly to /account" do
      get '/account'
      expect(last_response.body).to include('You Must <a href="/">Log In</a> to View Your Balance')
    end
  end

  describe "GET '/logout'" do
    it "clears the session" do
      get '/logout'
      expect(session[:user_id]).to be(nil)
    end
  end

end
