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
  #  binding.pry
    @user = User.find_by_username(params[:username])

  #  binding.pry
    if @user
      session[:user_id] = @user.id
      redirect '/account'
    else
      puts "Mo"
      erb :error
    end
  #  binding.pry
  end

  get '/account' do
    if Helpers.is_logged_in?(session)
        @user = User.find(session[:user_id])
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
