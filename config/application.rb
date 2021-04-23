require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module WebsiteTemplate
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Use vips for Active Storage image variants
    config.active_storage.variant_processor = :vips

    # Don't generate system test files.
    config.generators.system_tests = nil

    # Setup the supported locales for the project
    config.i18n.available_locales = %i[en]

    # Configure the Redis cache store
    cache_servers = ENV.fetch("REDIS_SOCKET") { "unix:///tmp/.s.REDIS.6379" }
    config.cache_store = :redis_cache_store, {
      url: cache_servers,
      connect_timeout: 20,
      read_timeout: 0.15,
      write_timeout: 0.15,
      reconnect_attempts: 1
    }

    # Share the cookies among all the domains by default
    config.session_store :cookie_store, domain: :all
  end
end
