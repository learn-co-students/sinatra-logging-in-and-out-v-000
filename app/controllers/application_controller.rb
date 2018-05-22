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
      @user = User.find_by(:username => params[:username])
      if @user != nil && @user.password == params["password"]
        session[:id] = @user.id
        redirect to '/account'
      end
    erb :'/views/error'
  end

  get '/account' do
    @user = User.new(username: params["username"], password:params["password"], balance: params["balance"])
    session[:id] = @user.id
    user.save
    erb :account
  end

  get '/logout' do

  end


end
