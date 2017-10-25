require 'openssl'
require 'net/http'
require 'json'
require 'base64'

require './constants.rb'

uri = URI.parse('https://api.twitter.com/oauth2/token')

response = Net::HTTP.start(uri.host, uri.port,
  :use_ssl => uri.scheme == 'https',
  :verify_mode => OpenSSL::SSL::VERIFY_NONE) do |http|

  request = Net::HTTP::Post.new uri.request_uri
  request.basic_auth $consumer_key, $consumer_secret
  request.body = "grant_type=client_credentials"

  http.request request
end

$bearer_token = JSON.parse(response.body)["access_token"]
