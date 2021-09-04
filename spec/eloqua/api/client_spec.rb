require 'eloqua/api/client'

RSpec.describe Eloqua::Api::Client, stub_eloqua_client_api: true do
  let(:client_object) do
    described_class.new(access_token: TEST_SAMPLE_TOKEN, base_url: TEST_SAMPLE_URL)
  end
  let(:params) do
    {
      test_name: 'client_testing'
    }
  end

  it 'verifies client includes the HTTParty' do
    expect(described_class).to include(HTTParty)
  end

  it 'verifies the headers are properly set' do
    headers = client_object.class.headers
    expect(headers['Authorization']).to eq("Bearer #{TEST_SAMPLE_TOKEN}")
    expect(headers['Accept']).to eq('application/json')
    expect(headers['Content-Type']).to eq('application/json')
  end

  it 'validates the response from call with one paramter' do
    request_response = client_object.call(api_endpoint: '/test')
    expect(request_response['name']).to eq('Osama Inayat')
    expect(request_response['rank']).to eq('Developer')
  end

  it 'validates the response from call with all possible paramter' do
    request_response = client_object.call(api_endpoint: '/test', method_type: :get, params: params)
    expect(request_response['name']).to eq('Osama Inayat')
    expect(request_response['rank']).to eq('Developer')
  end
end
