require 'sunlight_labs'

SunlightLabs.configure do |config|
  config.api_key = ENV['SUNLIGHT_API_KEY']
end
