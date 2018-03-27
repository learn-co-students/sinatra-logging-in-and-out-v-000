ENV["SINATRA_ENV"] ||= "development"

require 'sinatra/activerecord/rake'
require_relative './config/environment'

# Type `rake -T` on your command line to see the available rake tasks.

task :console do
  Pry.start
end

task :drop_and_migrate do
  puts "dropping database..."
  system("rm db/development.sqlite && rm db/schema.rb && rm db/test.sqlite")
  puts "migrating database..."
  system("bundle exec rake db:migrate && bundle exec rake db:migrate SINATRA_ENV=test")
  puts "seeding data"
  system("bundle exec rake db:seed")
end
