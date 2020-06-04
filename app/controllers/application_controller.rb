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
  @user =   User.find_by(username: params[:username])

  if @user != nil && @user.password == params[:password]
   session[:user_id] = @user.id
   redirect to '/account'
 else
   erb :error
  end

end

  get '/account' do
    if !session[:user_id]
      erb :error
else
    @user = User.find(session[:user_id])
  if @user
    erb :account
  else
    erb :error
  end
end
  end

  get '/logout' do
    session.clear
    redirect to '/'


  end


end
