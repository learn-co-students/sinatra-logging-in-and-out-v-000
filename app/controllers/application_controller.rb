require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  #==================== CONFIGURATION =====================
  #---------- Sessions #
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end
  #--------------------------------------------------------


  #==================== LOGIN =============================
  get '/' do
    erb :index
  end

  post '/login' do

  end

  get '/account' do

  end
  #--------------------------------------------------------


  #==================== LOGOUT ============================
  get '/logout' do
    
  end 
  #--------------------------------------------------------

end

