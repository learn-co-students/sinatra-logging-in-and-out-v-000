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

    if user = User.find(params[:username])
      session[:id] = user[:id]
      redirect '/account'
    else
      "Error"
    end

  end

  get '/account' do
    @user = User.find(session[:id])
    erb :account
  end

  get '/logout' do

  end


end
