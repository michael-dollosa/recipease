module MealDB
  class Request
    BASE_URL="https://www.themealdb.com/api/json/v2/"
    KEY = Rails.application.credentials.mealdb[:api_key]
    def connection
      @connection ||= Faraday.new do |conn|
        conn.url_prefix = "#{BASE_URL}/#{KEY}"
        conn.adapter adapter
      end
    end

  end
end
