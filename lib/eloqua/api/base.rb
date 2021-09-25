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

      def load_and_execute(api:, id: '', search_params: {}, query_params: {}, payload: {})
        request_payload = ELOQUA_ENDPOINTS[api.to_sym].dup
        unless nil_or_empty?(id.to_s)
          request_payload[:endpoint] =
            sub_id_in_endpoint(request_payload[:endpoint], id.to_s)
        end
        unless nil_or_empty?(search_params) && nil_or_empty?(query_params)
          request_payload[:endpoint] = extend_params_to_url(endpoint: request_payload[:endpoint],
                                                            query_params: query_params,
                                                            search_params: search_params)
        end
        request_payload[:params] = payload.to_json unless nil_or_empty?(payload)
        execute(request_payload)
      end

      private

      def nil_or_empty?(value)
        value.nil? || value.empty?
      end
    end
  end
end
