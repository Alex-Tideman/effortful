require 'what3words'

What3Words.configure do |config|
  config.what3words = What3Words::API.new(:key => ENV["what3words_api_key"])
end