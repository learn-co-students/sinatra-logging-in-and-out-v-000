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
    if @user
      if @user.password == params[:password]
        session[:user_id] = @user.id
        redirect '/account'
      else
        @message = "Incorrect Password"
        erb :error
      end
    else
      @message = "That user doesn't exist"
      erb :error
    end
  end

  get '/account' do
    if session[:user_id]
      @session = session
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
