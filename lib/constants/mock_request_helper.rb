def mock_request_with(method, url, response, body = {}, request_headers = {})
  WebMock.stub_request(method, url)
         .with(body: body, headers: request_headers)
         .to_return(
           status: 200,
           body: response,
           headers: { content_type: 'application/json' }
         )
end

def mock_request(method, url, response)
  WebMock.stub_request(method, url)
         .to_return(
           status: 200,
           body: response,
           headers: { content_type: 'application/json' }
         )
end
