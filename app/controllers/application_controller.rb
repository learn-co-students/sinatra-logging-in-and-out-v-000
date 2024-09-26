require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    if !!session[:id]
      redirect '/account'
    else
        erb :index
    end

  end

  post '/login' do
    @user = User.find_by(username: params[:username], password: params[:password])
    if !@user
      erb :error
    else
      session[:user_id] = @user.id
      redirect '/account'
    end
  end

  get '/account' do
    if Helpers.is_logged_in?(session)
      @current_user = Helpers.current_user(session)
      puts @current_user.username
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
