class ApplicationController < Sinatra::Base 
#==========================config========================== 
  register Sinatra::ActiveRecordExtension
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions unless test?
    set :session_secret, "secret"
  end
#==========================routes========================== 
  # HOME
#---------------------------------------------------index-# 
  get '/' do
    erb :index
  end
#========================================================== 
  # LOGIN
#---------------------------------------------------index-# 
  post '/login' do 
    @user = User.find_by(username: params[:username]) 
    if @user.nil? then erb :error else session[:user_id] = @user.id and redirect '/account' end
  end
#========================================================== 
  # ACCOUNT PAGE
#-------------------------------------------account/error-# 
  get '/account' do
    @user = User.find_by_id(session[:user_id])
    if @user.nil? then erb :error else erb :account end
  end
#========================================================== 
  # LOGOUT
#---------------------------------------------------------# 
  get '/logout' do
    session.clear
    redirect to '/'
  end
#========================================================== 
end