class User < ActiveRecord::Base
    has_many :friends
    has_many :subscriptions
    has_secure_password
end