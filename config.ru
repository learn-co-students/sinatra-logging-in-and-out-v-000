require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

class Sinatra::Base
  set :show_exceptions => false

  error { |err|
    Rack::Response.new(
      [{'error' => err.message}.to_json],
      500,
      {'Content-type' => 'application/json'}
    ).finish
  }
end

run ApplicationController
