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
    @user = User.create(params)
    session[:id] = @user.id
      redirect '/account'
  end

  get '/account' do
    #if there is no match, render the error page
    if !@user = User.find(session[:id])
      erb :error
    else
      erb :account
    end
  end

  get '/logout' do
    session.clear

  end


end
