require 'faraday'
require 'faraday_middleware'

module Youtube
  class Request
    BASE_URL = 'https://www.googleapis.com/'.freeze
    KEY = Rails.application.credentials.youtube_api[:KEY]

    attr_reader :api_key, :adapter

    def initialize(api_key: Rails.application.credentials.youtube_api[:KEY], adapter: Faraday.default_adapter)
      @api_key = api_key
      @adapter = adapter
    end

    def connection
      @connection ||= Faraday.new do |conn|
        conn.url_prefix = BASE_URL.to_s
        conn.request :json
        conn.params[:parts] = 'snippet'
        conn.params[:maxResult] = 1
        conn.params[:key] = @api_key
      end
    end
  end
end
