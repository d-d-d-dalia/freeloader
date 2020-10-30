class Subscription < ActiveRecord::Base
    belongs_to :friend
    belongs_to :user
end