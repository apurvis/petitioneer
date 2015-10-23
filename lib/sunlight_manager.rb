require 'faraday'
require 'faraday_middleware'

class SunlightManager
  attr_accessor :connection

  def initialize
    @logger = Logger.new(STDOUT)
    @connection = Faraday.new(url: 'https://congress.api.sunlightfoundation.com') do |connection|
      connection.request :json

      if ENV['SUNLIGHT_DEBUG'].to_s =~ /^(true|1)$/i
        connection.response :logger, @logger, bodies: true
      end
      connection.response :json, :content_type => /\bjson$/
      connection.adapter Faraday.default_adapter
    end
  end

  def get_by_zip(zip)
    path = '/legislators/locate'
    response = @connection.get(path, apikey: ENV['SUNLIGHT_API_KEY'], zip: zip)
    response.body['results']
  end
end
