require 'pry'

require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    @user = User.new(username: params["username"], password: params["password"])
    erb :index
  end

  post '/login' do
    @user = User.find_by(username: params["username"])
    if @user && @user.password == params[:password]
        session[:user_id] = @user.id
        redirect '/account'
    else 
       erb :error
    end
  end

  get '/account' do
    if !Helpers.is_logged_in?(session)
      erb :error
    else 
      @user = User.find_by(id: session[:user_id])
      erb :account
    end 
  end

  get '/logout' do
    session.clear
  end


end

