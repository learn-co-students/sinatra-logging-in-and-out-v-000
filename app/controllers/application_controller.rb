require_relative '../../config/environment'
require_relative '../helpers/helpers.rb'

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
    @user = User.find_by(username: params[:username], password: params[:password])
    if @user != nil
      # session[:id] = @user.id
      session[:user_id] = @user.id
      redirect '/account'
    else
      erb :error
    end
  end

  get '/account' do
    # @current = User.find_by_id(session[:user_id])
    if Helpers.is_logged_in?(session)
      @current = Helpers.current_user(session)
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
