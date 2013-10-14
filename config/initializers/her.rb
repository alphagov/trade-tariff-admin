Her::API.setup url: Rails.application.config.api_host do |c|
  c.use Faraday::Request::UrlEncoded
  c.use Her::Middleware::AcceptJSON
  c.use Her::Middleware::BearerTokenAuthentication, ENV['BEARER_TOKEN'] # lib/her/middleware/bearer_token_authentication.rb
  c.use Her::Middleware::HeaderMetadataParse # lib/her/middleware/header_metadata_parse.rb
  c.use Her::Middleware::DefaultParseJSON
  c.use Faraday::Adapter::NetHttp
end
