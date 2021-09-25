require 'httparty'
require 'helper/url_helper'
require 'eloqua/api/eloqua_api_exceptions'
module Eloqua
  module Api
    # provides single source of setting and calling apis
    class Client
      include HTTParty
      include UrlHelper
      include EloquaApiExceptions

      def initialize(access_token:, base_url:, authorization_type: DEFAULT_AUTHORIZATION_TYPE)
        self.class.base_uri sub_api_version(url: base_url)
        self.class.headers http_headers(access_token, authorization_type)
      end

      def call(api_endpoint:, method_type: :get, params: {})
        puts api_endpoint
        puts self.class.base_uri
        request_response = self.class.send(method_type, api_endpoint, body: params)
        return request_response.parsed_response if response_successful?(request_response)

        raise error_class(request_response),
              "Code: #{request_response.code}, response: #{request_response.parsed_response}"
      end

      private

      def error_class(response) # rubocop: disable all
        case response.code
        when HTTP_BAD_REQUEST_CODE
          BadRequestError
        when HTTP_UNAUTHORIZED_CODE
          UnAuthorizedError
        when HTTP_FORBIDDEN_CODE
          ForbiddenError
        when HTTP_NOT_FOUND_CODE
          NotFoundError
        when HTTP_SERVER_ERROR
          ServerError
        else
          StandardError
        end
      end

      def http_headers(access_token, authorization_type)
        {
          'Content-Type' => 'application/json',
          'Authorization' => format("#{authorization_type} %s", access_token),
          'Accept' => 'application/json'
        }
      end

      def response_successful?(response)
        puts response.code
        response.code == 200 &&
          (!response.parsed_response.nil? || response.parsed_response != 'Not authenticated.')
      end
    end
  end
end
