require_relative '../../config/environment'

class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    redirect '/account' if Helpers.is_logged_in?(session)

    erb :index
  end

  post '/login' do

  end

  get '/account' do

  end

  get '/logout' do
    session[:user_id] = nil
  end


end

