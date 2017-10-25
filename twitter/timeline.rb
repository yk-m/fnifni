require 'openssl'
require 'net/http'
require 'json'
require 'base64'

require './bearer_token.rb'

account_name = "bonjour_licca"
count = 10

timeline_uri = URI.parse("https://api.twitter.com/1.1/statuses/user_timeline.json?screen_name=#{account_name}&count=#{count}")

response = Net::HTTP.start(timeline_uri.host, timeline_uri.port,
  :use_ssl => timeline_uri.scheme == 'https',
  :verify_mode => OpenSSL::SSL::VERIFY_NONE) do |http|

  request = Net::HTTP::Get.new timeline_uri.request_uri
  request.add_field "Authorization", "Bearer #{$bearer_token}"

  http.request request
end

timeline = JSON.parse(response.body)

timeline.each do |tweet|
  puts tweet["text"]
end
