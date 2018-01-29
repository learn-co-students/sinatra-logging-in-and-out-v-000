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
    @user = User.find_by(username: params["username"])
    if !!@user == true && @user.password == params[:password]
      session[:id] = @user.id
      redirect '/account'
    else
      erb :error
    end
  end

  get '/account' do
    #binding.pry
    erb :account
  end

  get '/logout' do

  end


end
