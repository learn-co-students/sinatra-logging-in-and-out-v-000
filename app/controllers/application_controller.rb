require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end


  get '/' do
    #display form to log in with username and password

    erb :index
  end

  post '/login' do

    @username = params[:username] #username entered in form
    @password = params[:password] #username entered in form

    @current_user = User.find_by(username: @username, password: @password)
    if @current_user != nil && @current_user.password == @password
       session[:user_id] = @current_user.id
       redirect to '/account'

    else
    #otherwise show error.erb which will display link to login page '/'
     erb :error
   end

  end

  get '/account' do
    @current_user = User.find_by_id(session[:user_id])
    if @current_user
      erb :account
   else
      erb :error
   end

  end

  get '/logout' do

    session.clear

    redirect to '/'

  end


end
