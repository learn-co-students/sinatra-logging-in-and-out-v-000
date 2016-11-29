require "pry"
require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    @user1 = User.create(:username => "s123", :password => "s123", :balance => 1000)
    erb :index
  end

  post '/login' do
   @user= User.find_by(username: params[:username], password: params[:password] )
   if @user != nil
     session[:user_id] = @user.id
     redirect "/account"
   else
      erb :error
    end
  end

  get '/account' do

 if session[:user_id] != nil
    @user=User.find(session[:user_id])
   if @user != nil
   erb :account
 else
   erb :error
 end
 else
   erb :error
 end
  end

  get '/logout' do
    session.clear
  end


end
