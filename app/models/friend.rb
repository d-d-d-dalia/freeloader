class Friend < ActiveRecord::Base
    has_many :subscriptions
    belongs_to :user
end