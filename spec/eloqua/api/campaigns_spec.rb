require 'eloqua/api/campaigns'
require 'eloqua/api/base'

RSpec.describe Eloqua::Api::Campaigns, eloqua_campaigns_api_stub: true do
  let(:eloqua_base_object) do
    described_class.new(access_token: TEST_SAMPLE_TOKEN, base_url: TEST_SAMPLE_URL)
  end

  let(:test_data) do
    {
      'elements' => [
        {
          'id' => '1',
          'name' => 'I am Legend',
          'currentStatus' => 'Active'
        }
      ]
    }
  end

  let(:search_params) do
    {
      name: 'osama inayat',
      currentStatus: 1
    }
  end

  it 'verifies described_class is inheriting base class' do
    expect(described_class).to be < Eloqua::Api::Base
  end

  it 'verifies the campaigns api request response' do
    response_data = eloqua_base_object.all_campaigns(search_params: search_params)
    expect(response_data['elements']).to be_truthy
    expect(response_data['elements'].length).to be(1)
    response_data['elements'].each do |element|
      expect(test_data['elements'].find do |data|
               element['id'] == data['id'] && element['name'] == data['name'] &&
               element['currentStatus'] == data['currentStatus']
             end).to be_truthy
    end
  end

  it 'verifies hash for endpoint not getting changed' do
    response_data = eloqua_base_object.all_campaigns(search_params: search_params)
    expect(response_data['elements']).to be_truthy
  end

  it 'verifies the single campaign api request response' do
    response_data = eloqua_base_object.single_campaign(id: 1)
    expect(response_data).to be_truthy
    expect(test_data['elements'].find do |data|
      response_data['id'] == data['id'] && response_data['name'] == data['name'] &&
      response_data['currentStatus'] == data['currentStatus']
    end).to be_truthy
  end
end