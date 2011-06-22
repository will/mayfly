require 'restclient'

host = ENV["MAYFLY_HOST"] || "http://localhost:3000"

@r = RestClient::Resource.new "#{host}/ring"

count = 0
start = Time.now
loop do
  @r.get
  count += 1
  elapsed = Time.now-start

  if elapsed > 10
    puts "#{(count/elapsed).to_i} rps"
    count = 0
    start = Time.now
  end
end
