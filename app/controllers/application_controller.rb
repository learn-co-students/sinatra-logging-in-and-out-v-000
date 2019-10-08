require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
     if @user !=nil &&  @username.password = (params[:password])
      session[:user_id] = @user.idea
       redirect to "/account"
     end
     erb :error
  end

  get '/account' do
  @current_user = User.find_by(paramss[:user_id])
  
  end

  get '/logout' do

  end


end



describe "GET '/account'" do
  it "shows the error page if user goes directly to /account" do
    get '/account'
    expect(last_response.body).to include('You Must <a href="/">Log In</a> to View Your Balance')
  end

  it 'displays the account information if a user is logged in' do
    user1 = User.create(:username => "skittles123", :password => "iluvskittles", :balance => 1000)
    params = {
      "username"=> "skittles123", "password" => "iluvskittles"
    }
    post '/login', params
    get '/account'
    expect(last_response.body).to include("<h1>Welcome skittles123</h1>")
    expect(last_response.body).to include("<h3>Your Balance: 1000.0</h3>")
  end
end
