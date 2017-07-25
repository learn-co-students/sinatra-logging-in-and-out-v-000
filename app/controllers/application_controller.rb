require_relative '../../config/environment'
require 'pry'
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
    #params
    @user = User.find_by(params[:username], params[:password])
    if @user == nil
      redirect '/error'
    else
      session[:id] = @user.id
      redirect '/account'
    end
  end

  get '/account' do

  end

  get '/logout' do
    binding.pry
    session.clear
  end


end
