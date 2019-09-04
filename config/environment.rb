ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

require './config/environment'
require 'sinatra/activerecord/rake'

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)
configure :development do
  set :database, 'sqlite3:db/users.db'
end
require_all 'app'
