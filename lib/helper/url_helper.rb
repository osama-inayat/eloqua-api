module UrlHelper
  def sub_api_version(url:)
    url.gsub(/{version}/, DEFAULT_API_VERSION)
  end

  def sub_id_in_endpoint(endpoint, id)
    endpoint.gsub(/{id}/, id.to_s)
  end

  def extend_params_to_url(endpoint:, query_params:, search_params:)
    "#{endpoint}?#{query_params_string(query_params)}#{search_params_string(search_params)}"
  end

  private

  def query_params_string(query_params)
    return '' if query_params.empty?

    params_string = ''
    query_params&.each do |key, value|
      params_string += "#{key}=#{value}&"
    end
    params_string
  end

  def search_params_string(search_params)
    return '' if search_params.empty?

    search_string = ''
    search_params&.each do |key, value|
      search_string += "#{key}=\'*#{value}*\'"
    end
    search_string.empty? ? search_string : "search=#{search_string}"
  end
end
