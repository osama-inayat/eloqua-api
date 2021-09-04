require 'httparty'
require 'helper/url_helper'

module Eloqua
  module Api
    # provides single source of setting and calling apis
    class Client
      include HTTParty
      include UrlHelper

      def initialize(access_token:, base_url:, authorization_type: DEFAULT_AUTHORIZATION_TYPE)
        self.class.base_uri sub_api_version(url: base_url)
        self.class.headers http_headers(access_token, authorization_type)
      end

      def call(api_endpoint:, method_type: :get, params: {})
        puts self.class.base_uri
        request_response = self.class.send(method_type, api_endpoint, body: params)
        request_response.parsed_response
      end

      private

      def http_headers(access_token, authorization_type)
        {
          'Content-Type' => 'application/json',
          'Authorization' => format("#{authorization_type} %s", access_token),
          'Accept' => 'application/json'
        }
      end
    end
  end
end
