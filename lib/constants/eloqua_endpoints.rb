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
  }.freeze,
  update_campaign: {
    endpoint: '/assets/campaign/{id}',
    method: :put
  }.freeze,
  create_campaign: {
    endpoint: '/assets/campaign',
    method: :post
  }.freeze,
  activate_campaign: {
    endpoint: '/assets/campaign/active/{id}',
    method: :post
  }.freeze,
  deactive_campaign: {
    endpoint: '/assets/campaign/draft/{id}',
    method: :post
  }.freeze,
  delete_campaign: {
    endpoint: '/assets/campaign/{id}',
    method: :delete
  }
}.freeze
