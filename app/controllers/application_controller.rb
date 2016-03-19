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
    @user = User.find_by(username: params["username"])
    if @user 
      session[:user_id] = @user.id
      redirect '/account'
    else
      @session = session[:user_id]
      erb :error
    end
  end

  get '/account' do
    @session = session
    @user = User.find_by(id: session[:user_id])
    if Helpers.is_logged_in?(session) == false
      erb :error
    else
      erb :account
    end
  end

  get '/logout' do
    session.clear
  end


end

