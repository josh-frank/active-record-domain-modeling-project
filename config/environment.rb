require "bundler/setup"
Bundler.require
require "sinatra/activerecord"
require "ostruct"
require "date"
require_all 'app/models'

ENV["SINATRA_ENV"] ||= 'development'

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/development.sqlite"
)