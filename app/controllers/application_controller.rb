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
    @current_user = User.find_by(username: params["username"], password: params["password"])
    session[:user_id] = @current_user[:id]
    # binding.pry
    if !!User.find(session[:user_id])
      # erb :account
      redirect "/account"
    else
      erb :error
    end
  end

  get '/account' do
    # @current_user = User.find_by(username: params["username"], password: params["password"])
    @current_user = User.find(username: params["username"], password: params["password"])
    if !!User.find(session[:user_id])
      erb :account
    else
      erb :error
    end
  end

  get '/logout' do
    session.clear
    redirect "/"
  end


end
