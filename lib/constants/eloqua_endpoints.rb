ELOQUA_ENDPOINTS = {
  external_assets_types: {
    endpoint: '/assets/external/types',
    method: :get
  },
  single_asset_activities: {
    endpoint: '/assets/external/type/{id}',
    method: :get
  }
}.freeze
