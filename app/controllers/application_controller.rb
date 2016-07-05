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
    if (User.where("username = ? AND password = ?", params[:username], params[:password])) != []
      session[:user_id] = User.find_by(username: params[:username]).id
      redirect :account
    else
      erb :error
    end
  end

  get '/account' do
    erb :account
  end

  get '/logout' do
    session.clear
  end

  get '/error' do
    erb :error
  end

end
