require 'eloqua/api/base'

module Eloqua
  module Api
    class Campaigns < Eloqua::Api::Base
      def all_campaigns(search_params: {}, query_params: {})
        request_payload = ELOQUA_ENDPOINTS[:all_campaigns].dup
        request_payload[:endpoint] =
          extend_params_to_url(endpoint: request_payload[:endpoint], query_params: query_params,
                               search_params: search_params)
        execute(request_payload)
      end

      def single_campaign(id:)
        request_payload = ELOQUA_ENDPOINTS[:single_campaign].dup
        request_payload[:endpoint] = sub_id_in_endpoint(request_payload[:endpoint], id)
        execute(request_payload)
      end

      def update_campaign(id:, payload:)
        request_payload = ELOQUA_ENDPOINTS[:update_campaign].dup
        request_payload[:endpoint] = sub_id_in_endpoint(request_payload[:endpoint], id)
        request_payload[:params] = payload.to_json
        execute(request_payload)
      end
    end
  end
end
