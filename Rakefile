require 'active_record'
include ActiveRecord::Tasks

DatabaseTasks.db_dir = 'db'
DatabaseTasks.migrations_paths = ['db/migrate']


ENV["SINATRA_ENV"] ||= "development"

require 'sinatra/activerecord/rake'
require_relative './config/environment'

# Type `rake -T` on your command line to see the available rake tasks.

task :console do
  Pry.start
end