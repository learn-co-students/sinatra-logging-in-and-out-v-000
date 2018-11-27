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
    @user = User.find_by(username: params["username"],password: params["password"])
    # binding.pry
    if @user == "" || @user == nil
      erb :error
    else
      session[:user_id] = @user.id
      redirect '/account'
    end
  end

  get '/account' do
    # binding.pry
    if session[:user_id] == "" || session[:user_id] == nil
      erb :error
    else
      erb :account
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end


end
