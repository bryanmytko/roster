require 'dotenv'
require 'uri'

module WowApi
  ENDPOINT = "https://us.api.battle.net/wow/"
  API_KEY = ENV["API_KEY"]

  class Client
    def initialize
    end

    def request(method, path, query = {})
      case method
      when :get
        query[:apikey] = apikey
        options = { query: query }
        HTTParty.get(URI.encode(ENDPOINT + path), options)
      end
    end

    private

    def apikey
      raise StandardError.new("No API key set!") unless API_KEY
      API_KEY
    end
  end
end
