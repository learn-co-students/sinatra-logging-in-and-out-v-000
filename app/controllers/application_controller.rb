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
    # binding.pry
      if @user = User.find_by(username: params[:username], password: params[:password])
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
      erb :account
    end
  end

  get '/logout' do
    session.clear
    redirect '/'

  end


end
