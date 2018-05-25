require 'pusher'

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  # config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  # config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Asset digests allow you to set far-future HTTP expiration dates on all assets,
  # yet still be able to expire them through the digest params.
  config.assets.digest = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  # Memcache
  # config.cache_store = :dalli_store, 'localhost', { :pool_size => 5, :expires_in => 1.day, :compress => true }
  config.action_controller.perform_caching = false
end

Dynamoid.configure do |config|
  config.adapter = 'aws_sdk_v2' # This adapter establishes a connection to the DynamoDB servers using Amazon's own AWS gem.
  config.namespace = 'soulwalrus_development' # To namespace tables created by Dynamoid from other tables you might have. Set to nil to avoid namespacing.
  config.warn_on_scan = true # Output a warning to the logger when you perform a scan rather than a query on a table.
  config.read_capacity = 1 # Read capacity for your tables
  config.write_capacity = 1 # Write capacity for your tables
  config.endpoint = 'http://localhost:8000' # Comment this line if connecting to remote
end

Pusher.app_id = '202818'
Pusher.key = 'd7bac04aba128fb95645'
Pusher.secret = '0a9c4fd3d52477493b71'
Pusher.logger = Rails.logger
Pusher.encrypted = true
