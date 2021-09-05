require 'eloqua/api/base'

module Eloqua
  module Api
    class EloquaExternalAssetsTypes < Eloqua::Api::Base
      def fetch_external_assets_types(query_params: {})
        request_payload = ELOQUA_ENDPOINTS[:external_assets_types]
        request_payload[:endpoint] = extend_query_params(request_payload[:endpoint], query_params)
        execute(request_payload)
      end

      def fetch_single_asset_activities(id:)
        request_payload = ELOQUA_ENDPOINTS[:single_asset_activities]
        request_payload[:endpoint] = sub_id_in_endpoint(request_payload[:endpoint], id)
        execute(request_payload)
      end
    end
  end
end
