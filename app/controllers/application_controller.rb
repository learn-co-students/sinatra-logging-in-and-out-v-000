require 'pry'
require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    # binding.pry
    erb :index
  end

  post '/login' do
    # raise params.inspect
    binding.pry
    if User.find_by(username: params["username"]) != nil
      @user = User.find_by(username: params["username"])
      session[:id] = @user.id
      redirect '/account'
    else
      redirect '/error'
    end
  end

  get '/account' do
    puts "This is the account page"
  end

  get '/logout' do

  end

  get '/error' do
    puts "This is the error page"
  end
end
