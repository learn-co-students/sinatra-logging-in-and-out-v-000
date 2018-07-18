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
    @user = User.find_by(params)    
    if @user
      session[:user_id] = @user.id
      redirect to '/account'
    else
      erb :error
    end
  end

  get '/account' do
    @user = User.find_by_id(session[:user_id])
    # @user must first be established before the logic begins. Note the difference between `find` and `find_by`.
    if @user
      erb :account
    else
      erb :error
    end
    # Besides this controller logic, make sure to implement another display logic on the account.erb view.
  end

  get '/logout' do
    session.clear
    redirect to '/'
  end


end

