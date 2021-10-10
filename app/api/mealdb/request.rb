require 'faraday'
require 'faraday_middleware'

module Mealdb
  class Request
    BASE_URL = 'https://www.themealdb.com/api/json/v2/'.freeze
    KEY = Rails.application.credentials.mealdb[:api_key]

    attr_reader :api_key, :adapter

    def initialize(api_key: Rails.application.credentials.mealdb[:api_key], adapter: Faraday.default_adapter)
      @api_key = api_key
      @adapter = adapter
    end

    def connection
      @connection ||= Faraday.new do |conn|
        conn.url_prefix = "#{BASE_URL}#{api_key}"
        conn.request :json
        # conn.adapter @adapter
      end
    end
  end
end
