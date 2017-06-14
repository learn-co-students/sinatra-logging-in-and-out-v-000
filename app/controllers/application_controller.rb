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
    if @user = User.find_by(username: params[:username], password: params[:password])
      session[:id] = @user.id
      session[:username] = @user.username
      session[:balance] = @user.balance
      redirect '/account'
    else
      erb :error
    end
  end

  get '/account' do
    if !!session[:id]
      @balance = session[:balance]
      @username = session[:username]
      erb :account
     else
      erb:error
     end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

end
