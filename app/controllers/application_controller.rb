
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
    if User.find_by(username: params[:username]) == nil || User.find_by(password: params[:password]) == nil
      erb :error
    else
      @user = User.find_by(username: params[:username])
      session[:user_id] = @user.id
      redirect '/account'
    end
  end

  get '/account' do
    if session[:user_id] == nil
      erb :error
    else
      erb :account
    end
  end

  get '/error' do
    erb :error
  end

  get '/logout' do
    session.clear
    redirect '/'
  end
end
