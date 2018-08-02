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
    #binding.pry 
    if User.find_by(username: params["username"], password: params["password"])
      @user = User.find_by(username: params["username"], password: params["password"])
    else
      erb :error
    end

    session[:user_id] = @user.id
    #binding.pry
    redirect '/account'
  end

  get '/account' do
    erb :account
  end

  get '/logout' do

  end


end
