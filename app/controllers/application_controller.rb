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
    @user = User.find_by username: params[:username]
    #binding.pry
    if @user == nil
      erb :error
    else
      #binding.pry
      session[:user_id] = @user[:id]
      redirect '/account'
    end
  end

  get '/account' do
    #binding.pry
    erb :account
  end

  get '/logout' do
    session.clear
  end


end
