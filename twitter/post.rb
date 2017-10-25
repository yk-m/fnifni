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
tweet_uri = 'https://api.twitter.com/1.1/statuses/update.json'

response = endpoint.post(tweet_uri, { :status => 'あいうえお' })
