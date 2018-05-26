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
    @user = User.find_by(username: params[:username], password: params[:password])
    binding.pry
    if @user
      session[:id] = @user.id
      redirect to '/account'
    end
    erb :error
  end

  get '/account' do
    @user = User.find(session[:id])
    erb :'/account'
  end

  get '/logout' do
    session.clear
    redirect to '/'
  end


end
