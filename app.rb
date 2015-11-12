require_relative 'config/environment'

class App < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/login' do

  end

  post '/login' do
    redirect_to :account
  end

  get '/account' do

  end


end

#Add an array of hashes with usernames/passwords
#Hashes with 
