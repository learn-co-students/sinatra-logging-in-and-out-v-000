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
    @user = User.find_by(username: params[:username])
    if @user
    @session[:user_id]= @user.id
       redirect to '/account'
     else
       redirect to  '/error'
    end
 end
 #binding.pry

  get '/account' do
    if is_logged_in?
      redirect to '/account'
    else
      redirect to '/error'
  end

  get '/logout' do
    user.clear
    redirect to '/'
  end
 end
end
