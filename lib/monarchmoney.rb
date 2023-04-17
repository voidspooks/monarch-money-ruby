# frozen_string_literal: true

require 'net/http'
require 'uri'
require 'json'
require 'monarchmoney/queries'

module MonarchMoney
  class Client
    attr_reader :username
    attr_reader :token

    def initialize(username:, password:)
      @username = username
      @password = password
      @api_url = "https://api.monarchmoney.com"
      @auth_response = authenticate
      @token = get_token_from @auth_response
    end

    def get_accounts_page
    end

    private

    def accounts_page_query
    end

    def get_token_from(response)
      JSON.parse(response.body)["token"]
    end

    def request_body
      {
        username: @username,
        password: @password,
        trusted_device: true,
        supports_mfa: true
      }.to_json
    end

    def authenticate
      auth_endpoint = "#{@api_url}/auth/login/"
      uri = URI(auth_endpoint)

      https = Net::HTTP.new(uri.host, uri.port)
      https.use_ssl = true

      request = Net::HTTP::Post.new(uri.path)
      request.body = request_body
      request['accept'] = 'application/json'
      request['content-type'] = 'application/json'
      response = https.request(request)
      return response
    rescue => e
      raise "Could not authenticate with Monarch Money's API"
    end
  end
end
