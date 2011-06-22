require 'sinatra/base'
require 'json'
require './store'

class Mayfly < Sinatra::Base
  get '/ring' do
    {"item" => Ring.get}.to_json
  end

  post '/ring' do
    Ring.set JSON.parse(params[:data])
  end

  get '/queue' do
  end

  put '/queue' do
  end
end
