require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  #include Helpers

  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

  post '/login' do
    @user = User.find_by(username: params["username"])
  
    
    if @user != nil && @user != ""
      #binding.pry
      session[:user_id] = @user.id 
      @session = session[:user_id]
      #binding.pry
      redirect to '/account'
    else
      redirect to '/error'
    end
  end

  get '/account' do
    @session = session

    if @session != nil && @session != ""
     erb :account
    else
     erb :error
   end
  end

  get '/logout' do

  end

  get '/error' do
    erb :error
  end


end

