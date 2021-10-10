require 'faraday'

module Mealdb
  class Client
    # initialize connection
    @client = Request.new

    # get methods
    def self.search_by_ingredient(ingredient)
      # clean up spaces in search string
      str = ingredient.gsub(/\s+,/, ',').gsub(/,\s+/, ',').strip
      response = @client.connection.get("filter.php?i=#{str}")
      JSON.parse(response.body)
    end

    def self.search_by_meal(meal_id)
      response = @client.connection.get("lookup.php?i=#{meal_id}")
      JSON.parse(response.body)
    end

    def self.test
      'Client test successful'
    end
  end
end
