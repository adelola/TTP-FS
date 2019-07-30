IEX::Api.configure do |config|
    config.publishable_token = ENV['IEX_API_PUBLISHABLE_TOKEN']
    config.endpoint = 'https://sandbox.iexapis.com/v1' # defaults to 'https://cloud.iexapis.com/v1'
end