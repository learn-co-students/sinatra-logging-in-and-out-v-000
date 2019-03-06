require './config/environment'

if ActiveRecord::Migration.check_pending!
  raise 'Migrations are pending. Run `rake db:migrate SINATRA_ENV=test` to resolve the issue.'
end

run ApplicationController