class User < ActiveRecord::Base
end

@test = User.create(username: "test" , balance: 44, password: "123")
