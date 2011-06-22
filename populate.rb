require 'restclient'
require 'json'

host = ENV["MAYFLY_HOST"] || "http://localhost:3000"
data = %w[one two three four five six seven eight nine ten]

p RestClient.post "#{host}/ring", :data => data.to_json

