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

    if User.find_by(username: params["username"], password: params["password"])
      @user = User.find_by(username: params["username"], password: params["password"])
      session[:user_id] = @user.id
      redirect '/account'
    else
      erb :error
    end


  end

  get '/account' do
    #binding.pry
    if Helpers.is_logged_in?(session)
      @user = Helpers.current_user(session)
      #binding.pry
      erb :account
    else
      erb :error
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end


end
