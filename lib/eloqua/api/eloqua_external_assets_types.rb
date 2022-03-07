require 'eloqua/api/base'

module Eloqua
  module Api
    class EloquaExternalAssetsTypes < Eloqua::Api::Base
      def find_all(query_params: {}, search_params: {})
        load_and_execute(api: 'external_assets_types', query_params: query_params, search_params: search_params)
      end

      def find(id:)
        load_and_execute(api: 'single_asset_activities', id: id)
      end

      def create_external_activity(payload:)
        load_and_execute(api: 'create_external_activity', payload: payload)
      end
    end
  end
end
