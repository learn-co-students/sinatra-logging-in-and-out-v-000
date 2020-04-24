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
    # binding.pry
    @user = User.find_by(:username => params[:username]) #not sure how to read this, where is the data coming from?
    session[:user_id] = @user.id
      # if
      # # @user.username == session[:username]
      #   session[:user_id] = @user.id
      # else
      # #incorrect password
      # redirect to '/login'
      # end
redirect to '/login'
  end

  get '/account' do

  end

  get '/logout' do
    redirect to '/'
  end

end
