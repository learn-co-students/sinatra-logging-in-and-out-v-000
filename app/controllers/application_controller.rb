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
    @user = User.find_by(name: params["name"], email: params["email"], password: params["password"])
        if @user
          session[:id] = @user.id
          redirect '/account'
        else
          redirect '/error'
        end
      end

  get '/account' do

  end

  get '/logout' do
   session.clear
   redirect '/'
 end

  end
<<<<<<< HEAD
=======


>>>>>>> 7642f6a3112dad0dd31f0a26bece3f3619d2e81b
