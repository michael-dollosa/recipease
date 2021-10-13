require 'faraday'

module Mealdb
  class Client
    # initialize connection
    @client = Request.new

    # get methods
    def self.search_by_ingredient(ingredient)
      # clean up spaces in search string
      str = ingredient.gsub(/\s+,/, ',').gsub(/,\s+/, ',').strip
      @client.connection.get("filter.php?i=#{str}")
    end

    def self.search_by_meal(meal_id)
      @response = @client.connection.get("lookup.php?i=#{meal_id}")
      if (JSON.parse(@response.body))['meals'].present?
        { status: 'success', code: 200, message: 'Meal Found', body: @response }
      else
        { status: 'error', code: 404, message: 'No Meal Found', body: nil }
      end
    end

    def self.test
      'Client test successful'
    end
  end
end
