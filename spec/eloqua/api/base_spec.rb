require 'eloqua/api/base'

RSpec.describe Eloqua::Api::Base, stub_eloqua_client_api: true do
  let(:eloqua_base_object) do
    described_class.new(access_token: TEST_SAMPLE_TOKEN, base_url: TEST_SAMPLE_URL)
  end

  let(:request_payload) do
    {
      endpoint: '/test',
      method: :get
    }
  end

  it 'verifies working of execute method' do
    response_data = eloqua_base_object.execute(request_payload)
    expect(response_data['name']).to eq('Osama Inayat')
    expect(response_data['rank']).to eq('Developer')
  end
end
