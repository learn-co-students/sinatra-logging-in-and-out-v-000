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
    @user = User.find_by(username: params["username"], password: params["password"])
    if !@user
      erb :error
    else
    session[:user_id] = @user.id
    redirect '/account'
    end
  end

  get '/account' do
    #if there is no match, render the error page
    @c_user = User.find_by_id(session[:user_id])
    if @c_user
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
