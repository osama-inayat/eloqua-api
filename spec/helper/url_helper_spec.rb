require 'helper/url_helper'

RSpec.describe UrlHelper do
  let(:query_params) do
    {
      page: 10,
      count: 20
    }
  end

  let(:search_params) do
    {
      name: 'osama inayat',
      currentStatus: '1'
    }
  end

  let(:class_instance) { (Class.new { include UrlHelper }).new }

  it 'verifies working of \'extend_params_to_url\' method' do
    response = class_instance.extend_params_to_url(endpoint: '/id', query_params: query_params, search_params: search_params)
    expect(response).to eq("/id?page=10&count=20&search=name=\'*osama inayat*\'currentStatus='*1*'")
  end

  it 'verifies working of \'sub_api_version\'' do
    response = class_instance.sub_api_version(url: TEST_SAMPLE_URL)
    expect(response).to eq(TEST_SAMPLE_URL.gsub(/{version}/, DEFAULT_API_VERSION))
  end
end
