require 'helper/url_helper'

RSpec.describe UrlHelper do
  let(:query_params) do
    {
      page: 10,
      count: 20
    }
  end

  let(:class_instance) { (Class.new { include UrlHelper }).new }

  it 'verifies working of \'extend_query_params\' method' do
    response = class_instance.extend_query_params('/id', query_params)
    expect(response).to eq('/id?page=10&count=20&')
  end
end
