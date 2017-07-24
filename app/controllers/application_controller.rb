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
  #find the user in the database based on their username.
  @user = User.find_by(username: params[:username], password: params[:password])
  #If there is a match, set the session to the user's ID, redirect them to the /account route (using redirect to)
    if true
      redirect_to '/account'
    else
    #If there is no match, render the error page.
      erb :error
    end
  end

  get '/account' do

  end

  get '/logout' do
    session.clear
  end


end
