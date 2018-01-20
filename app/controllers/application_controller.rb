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
    if User.all.find_by(username: params[:username])
      @user = User.all.find_by(username: params[:username])
      session[:user_id] = @user.id
      @session = session
      redirect 'account'
    else
      erb :error
    end
  end

  get '/account' do
    erb :account
  end

  get '/logout' do
    @session.clear
    redirect '/'
  end


end
