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
    @user = User.new(username: params["username"], password: params["password"])
    @user.save
    session[:user_id] = @user.id
    redirect '/account'
  end

  get '/account' do
    erb :account
  end

  get '/logout' do

  end


end
