require 'faraday'

module Mealdb
  class Client
    # initialize connection
    @client = Request.new
    # get methods
    def self.search(ingredient)
      # clean up spaces in search string
      str = ingredient.gsub(/\s+,/, ',').gsub(/,\s+/, ',').strip
      @client.connection.get("filter.php?i=#{str}")
    end

    def self.test
      'Client test successful'
    end
  end
end
