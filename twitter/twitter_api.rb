require 'json'
require 'oauth'

require './constants.rb'

class TwitterAPI

  def initialize(consumer_key, consumer_secret, access_token, access_token_secret)
    consumer = OAuth::Consumer.new(
      consumer_key,
      consumer_secret,
      site:'https://api.twitter.com/'
    )
    @endpoint = OAuth::AccessToken.new(consumer, access_token, access_token_secret)
  end

  def get(account_name,
                   count: 200, trim_user: true, exclude_replies: true, contributor_details: true, include_rts: true)
    uri = "https://api.twitter.com/1.1/statuses/user_timeline.json?screen_name=#{account_name}&count=#{count}&trim_user=#{trim_user}&exclude_replies=#{exclude_replies}&contributor_details=#{contributor_details}&include_rts=#{include_rts}"
    JSON.parse(@endpoint.get(uri).body)
  end

  def put(tweets)
    tweets.each do |tweet|
      puts tweet["created_at"]
      puts tweet["text"]
      puts "♡ #{tweet["favorite_count"]} RT#{tweet["retweet_count"]}"
      puts ""
    end

    def tweets_to_strfile_format(tweets)
      return tweets.inject("") do |timeline, tweet|
        timeline << "\n%\n" if timeline != ""
        timeline << tweet["text"]
      end
    end

    def put_tweets_to_strfile(tweets, filename)
      File.open(filename, "w") do |file|
        file.puts tweets_to_strfile_format(tweets)
      end
    end
  end

end

api = TwitterAPI.new($consumer_key, $consumer_secret, $access_token, $access_token_secret)

tweets = api.get("bonjour_licca", count: 200, exclude_replies: true)
api.put_tweets_to_strfile(tweets, "licca")
