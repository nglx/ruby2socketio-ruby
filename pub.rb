require 'net/http'
require 'redis'
require 'json'

if ENV["REDISCLOUD_URL"]
  uri = URI.parse(ENV["REDISCLOUD_URL"])
  REDIS = Redis.new(host: uri.host, port: uri.port, password: uri.password)
elsif ENV["REDISTOGO_URL"]
  uri = URI.parse(ENV["REDISTOGO_URL"])
  REDIS = Redis.new(host: uri.host, port: uri.port, password: uri.password)
else
  REDIS = Redis.new
end

loop do
  out = Time.now.to_json
  puts "Sending #{out}..."
  REDIS.publish("ruby", out)
  sleep(1)
end