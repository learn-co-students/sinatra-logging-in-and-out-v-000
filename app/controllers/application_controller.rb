require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    @user1 = User.create(:username => "skittles123", :password => "iluvskittles", :balance => 1000)
    erb :index
  end

  post '/login' do
    @user = User.find_by(username: params[:username], password: params[:password])
    session[:id] = @user.id
    @user != nil ? (redirect to '/account') : (erb :error)
  end

  get '/account' do
    erb :account
  end

  get '/logout' do
    session.clear
  end


end
