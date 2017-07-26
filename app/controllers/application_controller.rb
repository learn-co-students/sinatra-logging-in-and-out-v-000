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

      #binding.pry
      if Helpers.is_logged_in?(session)#called for Helpers instead of self
        @user = User.find(session[:user_id])
        erb :account
      #elsif Helpers.current_user(session)#called for Helpers instead of self
      #  erb :account
      else
        erb :error
      end
  end

  get '/logout' do
    session.clear
    erb :index
  end
end
