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
    if  @user = User.find_by(username: params["username"], password: params["password"])
      session[:user_id] = @user.id
      redirect to '/account'
    else
      redirect to '/error'
    end
  end

  get '/account' do
    @user = Helpers.current_user(session)

  end

  get '/logout' do

  end


end
