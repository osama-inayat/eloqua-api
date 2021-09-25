require 'eloqua/api/wrapper/version'
require 'constants/constants'
require 'constants/eloqua_endpoints'
require 'eloqua/api/client'
require 'helper/url_helper'

module Eloqua
  module Api
    class Base
      include UrlHelper
      def initialize(access_token:, base_url:)
        @client = Eloqua::Api::Client.new(access_token: access_token, base_url: base_url)
      end

      def execute(request_payload)
        @client.call(api_endpoint: request_payload[:endpoint],
                     method_type: request_payload[:method],
                     params: request_payload[:params])
      end
    end
  end
end
