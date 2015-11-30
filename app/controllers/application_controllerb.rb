require_relative '../../config/environment'
class App < Sinatra::Base
  configure do
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

  post '/login' do

  end

  get '/account' do

  end

  get '/logout' do

  end


end

