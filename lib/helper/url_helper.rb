module UrlHelper
  def sub_api_version(url:)
    url.gsub(/{version}/, DEFAULT_API_VERSION)
  end
end
