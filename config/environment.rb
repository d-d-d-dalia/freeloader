require 'bundler/setup'
Bundler.require
require 'sinatra/activerecord'
require_all 'app'

connection_details = {
    adapter: 'sqlite3',
    database: 'db/subscriptions.db'
}

ActiveRecord::Base.establish_connection(connection_details)