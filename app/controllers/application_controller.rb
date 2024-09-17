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
  get '/login' do
    erb :login
  end
  
  post '/login' do
    @user=User.find_by(params)
    if @user!=nil then session[:user_id]=@user.id; redirect '/account' end
    erb :error
  end


  get '/account' do
    if Helpers.is_logged_in?(session) then
        @user=Helpers.current_user(session)
        erb :account
       else
         erb :error
       end
  end

  get '/logout' do

  end


end

