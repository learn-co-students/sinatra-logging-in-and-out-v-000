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
    @user = User.find_by(username: params[:username], password: params[:password])
    if @user == nil
      erb :error
    else
      session[:id] = @user.id
    end
    redirect '/account'
  end

  get '/account' do
    erb :account
  end

  get '/logout' do
    session.clear
    redirect '/'
  end


end
