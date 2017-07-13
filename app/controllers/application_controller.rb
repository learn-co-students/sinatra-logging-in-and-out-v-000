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

  post '/login' do
    if User.find_by(params)
      session[:user_id] = User.find_by(params).id
      redirect '/account'
    elsif User.find_by(username: params[:username])
      # password must be wrong
      @error = "Incorrect password."
      erb :error
    else
      @error = "User #{params[:username]} not found."
      erb :error
    end

  end

  get '/account' do

    if Helpers::is_logged_in?(session)
      erb :account
    else
      @error = "Please log in."
      erb :error
    end

  end

  get '/logout' do
    session.clear
    redirect '/'
  end


end

