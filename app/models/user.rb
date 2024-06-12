class User < ActiveRecord::Base
  validates :username, :password, :balance, presence: true
end
