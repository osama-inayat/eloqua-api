module UrlHelper
  def sub_api_version(url:)
    url.gsub(/{version}/, DEFAULT_API_VERSION)
  end

  def query_params_string(query_params)
    params_string = ''
    query_params&.each do |key, value|
      params_string += "#{key}=#{value}&"
    end
    params_string
  end

  def sub_id_in_endpoint(endpoint, id)
    endpoint.gsub(/{id}/, id.to_s)
  end

  def extend_query_params(endpoint, query_params)
    return endpoint if query_params.empty?

    "#{endpoint}?#{query_params_string(query_params)}"
  end
end
