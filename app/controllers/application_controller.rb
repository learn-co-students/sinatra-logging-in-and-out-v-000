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

  get '/account' do
  @user = User.find_by_id(session[:user_id])
  # binding.pry
    if @user
      erb :account
    else
      erb :error
    end
  end

  post '/login' do
    @user = User.find_by(username: params["username"])
    
    # binding.pry
    if @user && params["username"] == @user.username
    session[:user_id] = @user.id
        # binding.pry
        redirect '/account'
    else 
      erb :error 
    end
  end

  get '/logout' do
    session.clear
    redirect to '/'
  end

end

