require 'net/http'
require 'json'

url = URI.parse('http://httpbin.org/get')
text_res = Net::HTTP.get(url)
res = JSON.parse(text_res)
puts res['origin']


