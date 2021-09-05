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

  it 'verifies the api request response for \'external-assets-types\'' do
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

RSpec.describe Eloqua::Api::EloquaExternalAssetsTypes, single_asset_activities_api_stub: true do
  let(:external_assets_type_obj) do
    described_class.new(access_token: TEST_SAMPLE_TOKEN, base_url: TEST_SAMPLE_URL)
  end

  let(:activities_test_data) do
    {
      'id' => '1',
      'name' => 'Webinar',
      'activityTypes' => [
        {
          'id' => '1000',
          'name' => 'Registered'
        },
        {
          'id' => '1001',
          'name' => 'Attended'
        }
      ]
    }
  end

  it 'verifies the api request response for \'single-asset-type-activities\'' do
    response_data = external_assets_type_obj.fetch_single_asset_activities(id: 1)
    expect(response_data['id']).to eq(activities_test_data['id'])
    expect(response_data['name']).to eq(activities_test_data['name'])
    expect(response_data['activityTypes'].length).to be(2)
    response_data['activityTypes'].each do |element|
      expect(activities_test_data['activityTypes'].find do |data|
               element['id'] == data['id'] && element['name'] == data['name']
             end).to be_truthy
    end
  end
end
