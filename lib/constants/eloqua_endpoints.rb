ELOQUA_ENDPOINTS = {
  external_assets_types: {
    endpoint: '/assets/external/types',
    method: :get
  }.freeze,
  single_asset_activities: {
    endpoint: '/assets/external/type/{id}',
    method: :get
  }.freeze,
  all_campaigns: {
    endpoint: '/assets/campaigns',
    method: :get
  }.freeze,
  single_campaign: {
    endpoint: '/assets/campaign/{id}',
    method: :get
  }.freeze
  update_campaign: {
    endpoint: '/assets/campaign/{id}',
    method: :put
  }.freeze
}.freeze
