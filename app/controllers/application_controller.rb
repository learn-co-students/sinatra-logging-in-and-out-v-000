require_relative '../../config/environment'
require 'pry'

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
    @user = User.find_by(username: params["username"], password: params["password"])
    #binding.pry
    if @user == nil
      erb :error
    else
      session[:user_id] = @user.id#raise params.inspect for params info
      redirect '/account'
    end
  end
  get '/error' do
    erb :error
  end

  get '/account' do
      #@user = User.find(session[:id])
      if session[:user_id]#called for Helpers instead of self
        #binding.pry
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
