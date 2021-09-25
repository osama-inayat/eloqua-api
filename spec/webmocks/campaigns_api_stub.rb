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
    base_url = 'https://eloqua-api-wrapper.com/API/REST/2.0/'
    campaigns_url = "#{base_url}assets/campaigns?search=name=\'*osama inayat*\'currentStatus='*1*'"
    single_campaign_url = Addressable::Template.new "#{base_url}assets/campaign/1"

    common_headers = { content_type: 'application/json' }
    if example.metadata[:eloqua_campaigns_api_stub]
      WebMock.stub_request(:get, campaigns_url)
             .to_return(
               status: 200,
               body: campaigns_response,
               headers: common_headers
             )
      WebMock.stub_request(:get, single_campaign_url)
             .to_return(
               status: 200,
               body: single_campaign_response,
               headers: common_headers
             )
      WebMock.stub_request(:put, single_campaign_url)
             .with(body: payload_hash, headers: request_headers)
             .to_return(
               status: 200,
               body: update_campaign_response,
               headers: common_headers
             )
    end
  end
end
