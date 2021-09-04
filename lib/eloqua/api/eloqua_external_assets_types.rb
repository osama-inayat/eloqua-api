require 'eloqua/api/base'

module Eloqua
  module Api
    class EloquaExternalAssetsTypes < Eloqua::Api::Base
      def fetch_external_assets_types
        execute(ELOQUA_ENDPOINTS[:external_assets_types])
      end
    end 
  end
end
