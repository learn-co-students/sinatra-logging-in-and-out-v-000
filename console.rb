#you can customize this for individual projects, allowing you to run your code and play around inside to see how things are working :-)around

require_relative "./config/environment.rb"
def reload!
    load './app/models/user.rb'
    load './app/helpers/helpers.rb'
    load './config/environment.rb'
end


require_relative './app/models/user.rb'
require_relative './app/helpers/helpers.rb'


Pry.start