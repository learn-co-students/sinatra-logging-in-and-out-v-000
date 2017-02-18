require 'pry'
require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    binding.pry
    erb :index
  end

  post '/login' do
    # raise params.inspect
    binding.pry
    @user = User.find(session[:id])

  end

  get '/account' do

  end

  get '/logout' do

  end


end
