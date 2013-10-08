require 'redis'
require 'json'

REDIS = Redis.new

loop do
  out = Time.now.to_json
  puts "Sending #{out}..."
  REDIS.publish("ruby", out)
  sleep(1)
end