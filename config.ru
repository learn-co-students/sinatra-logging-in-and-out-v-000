require './config/environment'

# if ActiveRecord::Base.connection.migration_keys.needs_migration?
#   raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
# end
# causing errors (no tests run either) when present here and in spec helper (getting undefined method/NoMethodError for migration_context and needs_migration?)

run ApplicationController
