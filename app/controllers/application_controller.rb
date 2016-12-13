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
    @user = User.find_by_username(params[:username])
    # binding.pry
    if @user != nil
      session[:user_id] = @user.id
      @session = session
      redirect to '/account'
    else
      erb :error
    end
  end

  get '/account' do
    if session[:user_id] != nil
      # binding.pry
      erb :account
    else
      erb :error
    end
  end

  get '/logout' do
    @session.clear
  end

end
