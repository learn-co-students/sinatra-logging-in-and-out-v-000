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
    if @user = User.all.find_by(username: params[:username])
      session = @user.id
      redirect '/account'
    else
      erb :error
    end
  end

  get '/account' do

  end

  get '/logout' do

  end


end
