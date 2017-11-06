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
    if User.find_by(username: params[:username]) == nil
      erb :error
    else
      @user = User.find_by(username: params[:username])
      session[:id] = @user.id

      redirect '/account'
    end
  end

  get '/account' do
    @user = User.find(session[:id])

    erb :account
  end

  get '/logout' do
    session.clear
  end


end
