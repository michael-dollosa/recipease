require 'faraday'

module Youtube
  class Client
    # initialize connection
    @client = Request.new

    # get methods
    def self.search_video(str)
      @response = @client.connection.get('/youtube/v3/search', { q: str })
      JSON.parse(@response.body)['items'][0]['id']['videoId']
    end

    def self.test
      'Client test successful'
    end
  end
end
