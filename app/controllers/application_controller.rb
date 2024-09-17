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

    if @user.class == User
      session[:user_id] = @user[:id]
      @session = session
      redirect to '/account'
    else
      erb :error
    end

  end

  get '/account' do
    @session = session
    if !@session[:user_id]
      erb :error
    else
      erb :account
    end
  end

  get '/logout' do
    session.clear
    redirect to '/'
  end
end
