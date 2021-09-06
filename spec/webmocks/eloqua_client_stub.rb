RSpec.configure do |config|
  sample_response_for_client = {
    'name' => 'Osama Inayat',
    'rank' => 'Developer'
  }.to_json

  config.before do |example|
    base_url = 'https://secure.p02.eloqua.com/API/REST/2.0/'
    if example.metadata[:stub_eloqua_client_api]
      WebMock.stub_request(:get, "#{base_url}test")
             .to_return(
               status: 200,
               body: sample_response_for_client,
               headers: {
                 content_type: 'application/json'
               }
             )
    elsif example.metadata[:eloqua_bad_request_stub]
      error_stub(HTTP_BAD_REQUEST_CODE, base_url)
    elsif example.metadata[:eloqua_not_found_request_stub]
      error_stub(HTTP_NOT_FOUND_CODE, base_url)
    elsif example.metadata[:eloqua_unauthorized_request_stub]
      error_stub(HTTP_UNAUTHORIZED_CODE, base_url)
    elsif example.metadata[:eloqua_forbidden_request_stub]
      error_stub(HTTP_FORBIDDEN_CODE, base_url)
    elsif example.metadata[:eloqua_server_error_request_stub]
      error_stub(HTTP_SERVER_ERROR, base_url)
    end
  end

  def error_stub(error_code:, url:)
    WebMock.stub_request(:get, "#{url}error_raise")
           .to_return(
             status: error_code,
             body: sample_response_for_client,
             headers: {
               content_type: 'application/json'
             }
           )
  end
end
