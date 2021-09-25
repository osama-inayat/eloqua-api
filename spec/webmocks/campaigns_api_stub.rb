RSpec.configure do |config|
  campaigns_response = { 'elements' =>
      [{ 'type' => 'Campaign',
         'currentStatus' => 'Active',
         'id' => '1',
         'name' => 'I am Legend' }] }.to_json

  single_campaign_response = {
    'type' => 'Campaign',
    'currentStatus' => 'Active',
    'id' => '1',
    'name' => 'I am Legend'
  }.to_json

  update_campaign_response = {
    'name' => 'Test Name',
    'startAt' => 12345,
    'endAt' => 34566,
    'id' => 1
  }.to_json

  payload_hash = {
    id: 1,
    name: 'Testing',
    startAt: 12344,
    endAt: 43432
  }.to_json

  request_headers = {
    'Accept' => 'application/json',
    'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
    'Authorization' => 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9',
    'Content-Type' => 'application/json',
    'User-Agent' => 'Ruby'
  }

  config.before do |example|
    base_url = 'https://eloqua-api-wrapper.com/API/REST/2.0'
    campaigns_url = "#{base_url}/assets/campaigns?search=name=\'*osama inayat*\'currentStatus='*1*'"
    single_campaign_url = Addressable::Template.new "#{base_url}#{ELOQUA_ENDPOINTS[:single_campaign][:endpoint]}"
    create_campaign = "#{base_url}/assets/campaign"
    activate_campaign =
      Addressable::Template.new "#{base_url}#{ELOQUA_ENDPOINTS[:activate_campaign][:endpoint]}?active=true"
    deactivate_campaign =
      Addressable::Template.new "#{base_url}#{ELOQUA_ENDPOINTS[:deactive_campaign][:endpoint]}"

    if example.metadata[:eloqua_campaigns_api_stub]
      mock_request(:get, campaigns_url, campaigns_response)
      mock_request(:get, single_campaign_url, single_campaign_response)
      mock_request_with(:put, single_campaign_url, update_campaign_response, payload_hash, request_headers)
      mock_request_with(:post, create_campaign, single_campaign_response, payload_hash, request_headers)
      mock_request(:post, activate_campaign, single_campaign_response)
      mock_request(:post, deactivate_campaign, single_campaign_response)
    end
  end
end
