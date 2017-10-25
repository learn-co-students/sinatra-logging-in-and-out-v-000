require 'pry'
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

  # Submit credentials, find user in db by id, if found, redirect to account page, else error page
  post '/login' do
    if @user = User.find_by(params)
      session[:user_id] = @user.id
      redirect '/account'
    else
      erb :error
    end
  end

  # Find @current_user by user_id, if so, display account, else error page
  get '/account' do
    @current_user = User.find_by(session[:user_id])
    if @current_user
      erb :account
    else
      erb :error
    end
  end

  # Clear session hash
  get '/logout' do
    session.clear
    redirect '/'
  end


end
