Rails.application.configure do
  IEX::Api.configure do |config|
    config.publishable_token = ENV['IEX_API_PUBLISHABLE_TOKEN']
    config.endpoint = 'https://cloud.iexapis.com/v1' 
  end

  config.action_mailer.default_url_options = { host: 'localhost:3000' }
  config.cache_classes = false
  config.eager_load = false   # Do not eager load code on boot.
  config.consider_all_requests_local = true

  if Rails.root.join('tmp/caching-dev.txt').exist?   # Enable/disable caching. 
    config.action_controller.perform_caching = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.seconds.to_i}"
    }
  else
    config.action_controller.perform_caching = false
    config.cache_store = :null_store
  end

  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.perform_caching = false
  config.active_support.deprecation = :log
  config.active_record.migration_error = :page_load
  config.assets.debug = true
  config.assets.quiet = true
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker
end
