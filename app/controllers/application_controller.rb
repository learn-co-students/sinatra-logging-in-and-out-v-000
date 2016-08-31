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
    puts params
    @user = User.find_by(username: params["username"], password: params["password"])
    puts @user.id 
    
    if @user.id == nil?
      redirect to '/error'
    else
      session[:user_id] = @user.id
      redirect to '/account'
    end
  end

  get '/account' do

    erb :'views/account'
  end

  get '/logout' do

  end


end

