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
    @user = find_by_(username: params[:username], password: params[:password])
    if @user
      login[:user_id] = @user_id
      redirect '/account'
    end 
   redirect '/error'
  end



  get '/account' do

  end

  get '/logout' do

  end


end

