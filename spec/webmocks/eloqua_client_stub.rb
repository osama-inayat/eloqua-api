RSpec.configure do |config|
  sample_response_for_client = {
    'name' => 'Osama Inayat',
    'rank' => 'Developer'
  }.to_json

  config.before do |example|
    if example.metadata[:stub_eloqua_client_api]
      WebMock.stub_request(:get, 'https://secure.p02.eloqua.com/API/REST/2.0/test').
        to_return(
          status: 200,
          body: sample_response_for_client,
          headers: {
            content_type: 'application/json'
          }
        )
    end
  end
end
