ELOQUA_ENDPOINTS = {
  external_assets_types: {
    endpoint: '/assets/external/types',
    method: :get
  },
  single_asset_activities: {
    endpoint: '/assets/external/type/{id}',
    method: :get
  },
  all_campaigns: {
    endpoint: '/assets/campaigns',
    method: :get
  },
  single_campaign: {
    endpoint: '/assets/campaign/{id}',
    method: :get
  }
}.freeze
