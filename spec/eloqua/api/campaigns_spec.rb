require 'eloqua/api/campaign'
require 'eloqua/api/base'

RSpec.describe Eloqua::Api::Campaign, eloqua_campaigns_api_stub: true do
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

  let(:campaign_payload) do
    {
      id: 1,
      name: 'Testing',
      startAt: 12344,
      endAt: 43432
    }
  end

  it 'verifies described_class is inheriting base class' do
    expect(described_class).to be < Eloqua::Api::Base
  end

  it 'verifies the campaigns api request response' do
    response_data = eloqua_base_object.find_all(search_params: search_params)
    expect(response_data['elements']).to be_truthy
    expect(response_data['elements'].length).to be(1)
    response_data['elements'].each do |element|
      expect(test_data['elements'].find do |data|
               element['id'] == data['id'] && element['name'] == data['name'] &&
               element['currentStatus'] == data['currentStatus']
             end).to be_truthy
    end
  end

  it 'verifies the single campaign api request response' do
    response_data = eloqua_base_object.find(id: 1)
    expect(response_data).to be_truthy
    expect(test_data['elements'].find do |data|
      response_data['id'] == data['id'] && response_data['name'] == data['name'] &&
      response_data['currentStatus'] == data['currentStatus']
    end).to be_truthy
  end

  it 'verifies the campaign updation api' do
    response_data = eloqua_base_object.update(id: 1, payload: campaign_payload)
    expect(response_data).to be_truthy
    expect(response_data['name']).to eq('Test Name')
    expect(response_data['startAt']).to eq(12345)
    expect(response_data['endAt']).to eq(34566)
  end

  it 'verifies the campaign creation api' do
    response_data = eloqua_base_object.create(payload: campaign_payload)
    expect(response_data).to be_truthy
  end

  it 'verifies the campaign activate api' do
    response_data = eloqua_base_object.activate(id: 1, query_params: { active: true })
    expect(response_data).to be_truthy
  end

  it 'verifies the campaign deactivate api' do
    response_data = eloqua_base_object.deactivate(id: 1)
    expect(response_data).to be_truthy
  end

  it 'verifies the campaign deletion api' do
    response_data = eloqua_base_object.destroy(id: 1)
    expect(response_data).to be_truthy
  end
end
