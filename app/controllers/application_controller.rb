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

  # The `get '/signup'` and `post '/resistrations'` routes were added
  # in order to create a user and save him/her to the database to
  # test all the other routes.

  get '/signup' do # not part of original lab

    erb :signup
  end

  post '/registrations' do # not part of original lab
    @user = User.new(username: params[:username], password: params[:password], balance: params[:balance])
    @user.save
    session[:user_id] = @user.id
    redirect '/account'
  end

  post '/login' do
    @user = User.find_by(username: params[:username], password: params[:password])
    if @user
      session[:user_id] = @user.id
      redirect to '/account'
    else
      erb :error
    end
  end

  get '/account' do
    @current_user = User.find_by_id(session[:user_id])
    if @current_user
      erb :account
    else
      erb :error
    end
  end

  get '/logout' do
    session.clear
    redirect to '/'
  end


end

