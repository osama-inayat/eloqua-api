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

  config.before do |example|
    base_url = 'https://eloqua-api-wrapper.com/API/REST/2.0/'
    campaigns_url = "#{base_url}assets/campaigns?search=name=\'*osama inayat*\'currentStatus='*1*'"
    single_campaign_url = "#{base_url}assets/campaign/1"
    if example.metadata[:eloqua_campaigns_api_stub]
      WebMock.stub_request(:get, campaigns_url)
             .to_return(
               status: 200,
               body: campaigns_response,
               headers: {
                 content_type: 'application/json'
               }
             )
      WebMock.stub_request(:get, single_campaign_url)
             .to_return(
               status: 200,
               body: single_campaign_response,
               headers: {
                 content_type: 'application/json'
               }
             )
    end
  end
end
