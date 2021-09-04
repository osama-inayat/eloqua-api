require 'eloqua/api/eloqua_external_assets_types'
require 'eloqua/api/base'

RSpec.describe Eloqua::Api::EloquaExternalAssetsTypes, external_asset_types_api_stub: true do # rubocop: disable all
  let(:external_assets_type_obj) do
    described_class.new(access_token: TEST_SAMPLE_TOKEN, base_url: TEST_SAMPLE_URL)
  end
  let(:test_data) do
    [
      {
        'id' => '1',
        'name' => 'Webinar'
      },
      {
        'id' => '2',
        'name' => 'Tradeshow'
      },
      {
        'id' => '3',
        'name' => 'Horseshow'
      },
      {
        'id' => '5',
        'name' => 'Testing 5'
      }
    ]
  end

  it 'verifies described_class is inheriting base class' do
    expect(described_class).to be < Eloqua::Api::Base
  end

  it 'verifies the api request response' do
    response_data = external_assets_type_obj.fetch_external_assets_types
    expect(response_data['elements']).to be_truthy
    expect(response_data['elements'].length).to be(4)
    response_data['elements'].each do |element|
      expect(test_data.find do |data|
               element['id'] == data['id'] && element['name'] == data['name']
             end).to be_truthy
    end
  end
end
