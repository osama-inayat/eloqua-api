require 'eloqua/api/base'

module Eloqua
  module Api
    class Campaign < Eloqua::Api::Base
      def find_all(search_params: {}, query_params: {})
        load_and_execute(api: 'all_campaigns', search_params: search_params,
                         query_params: query_params)
      end

      def find(id:)
        load_and_execute(api: 'single_campaign', id: id)
      end

      def update(id:, payload:)
        load_and_execute(api: 'update_campaign', id: id, payload: payload)
      end

      def create(payload:)
        load_and_execute(api: 'create_campaign', payload: payload)
      end

      def activate(id:, query_params:)
        load_and_execute(api: 'activate_campaign', id: id, query_params: query_params)
      end

      def deactivate(id:)
        load_and_execute(api: 'deactive_campaign', id: id)
      end

      def destroy(id:)
        load_and_execute(api: 'delete_campaign', id: id)
      end
    end
  end
end
