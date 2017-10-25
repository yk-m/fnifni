require 'json'
require 'oauth'

require './constants.rb'

consumer = OAuth::Consumer.new(
  $consumer_key,
  $consumer_secret,
  site:'https://api.twitter.com/'
)
endpoint = OAuth::AccessToken.new(consumer, $access_token, $access_token_secret)

account_name = "mssr_nm"
count = 10
timeline_uri = "https://api.twitter.com/1.1/statuses/user_timeline.json?screen_name=#{account_name}&count=#{count}"

response = endpoint.get(timeline_uri)

timeline = JSON.parse(response.body)

timeline.each do |tweet|
  puts tweet["text"]
end
