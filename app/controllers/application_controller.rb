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
    User.all.each do |user|
      if user.username == params[:username] && user.password == params[:password]
        session[:user_id] = user.id	
        redirect to '/account'	
      end	
    end	
   erb :error
  end
 

  get '/account' do
    
    @user = User.find(session[:user_id])
   erb :account
  end

  get '/logout' do
    session.clear 
    redirect '/'
  end


end
