require 'sinatra'
require_relative 'poker_oob.rb'
get '/' do
    erb :page
end
post '/page' do
    redirect '/'
end