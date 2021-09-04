RSpec.configure do |config|
  external_assets_types_response = { 'elements' =>
      [{ 'type' => 'ExternalAssetType', 'id' => '1', 'createdAt' => '1256486517',
         'depth' => 'minimal', 'name' => 'Webinar', 'updatedAt' => '1256486517' },
       { 'type' => 'ExternalAssetType', 'id' => '2', 'createdAt' => '1256486517',
         'depth' => 'minimal', 'name' => 'Tradeshow', 'updatedAt' => '1256486517' },
       { 'type' => 'ExternalAssetType',
         'id' => '3',
         'createdAt' => '1617908682',
         'createdBy' => '9',
         'depth' => 'minimal',
         'name' => 'Horseshow',
         'updatedAt' => '1628283687',
         'updatedBy' => '9' },
       { 'type' => 'ExternalAssetType',
         'id' => '5',
         'createdAt' => '1629729491',
         'createdBy' => '9',
         'depth' => 'minimal',
         'name' => 'Testing 5',
         'updatedAt' => '1629729491',
         'updatedBy' => '9' }] }.to_json

  config.before do |example|
    base_url = 'https://secure.p02.eloqua.com/API/REST/2.0/'
    if example.metadata[:external_asset_types_api_stub]
      WebMock.stub_request(:get, "#{base_url}assets/external/types")
             .to_return(
               status: 200,
               body: external_assets_types_response,
               headers: {
                 content_type: 'application/json'
               }
             )
    end
  end
end
