require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  #Homepage
  get '/' do
    erb :index
  end

  #Renders Log-in page, finds a User if exists, and redirect it to the account page if exists, else takes to error page
  post '/login' do
    @user = User.find_by(username: params[:username], password: params[:password])
    if @user
      session[:user_id] = @user.id
      redirect '/account'
    else
      erb :error
    end
  end

  #Renders account page if User is logged in, or else renders the error page
  get '/account' do
    @user = User.find_by(session[:user_id])
    if @user
      erb :account
    else
      erb :error
    end
  end

  #Logs the user out, by clearing the session
  get '/logout' do
    session.clear
    redirect '/'
  end

end
