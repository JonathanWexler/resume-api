require 'sinatra'
require 'sinatra/namespace'

require 'json'
require 'sinatra/activerecord'
db = URI.parse('postgres:///resume-api')

ActiveRecord::Base.establish_connection(
  :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
  :host     => db.host,
  :username => db.user,
  :password => db.password,
  :database => db.path[1..-1],
  :encoding => 'utf8'
)
require './models'
require 'bcrypt'
# require 'bundler/setup'
require 'sinatra/base'
# require 'rack-flash'

puts "ok"

enable :sessions
set :sessions => true
require 'sinatra/cross_origin'

set :port, 8080 
set :environment, :production 
configure do
  enable :cross_origin
end

