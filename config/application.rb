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
# require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
# require "sprockets/railtie"
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

    # Configure the Action Mailer
    config.action_mailer.delivery_method = :smtp

    # Use vips for Active Storage image variants
    config.active_storage.variant_processor = :vips

    # Configure the Redis cache store
    config.cache_store = :redis_cache_store

    # Share the cookies among all the domains by default
    config.session_store :cookie_store, key: "_website_demo", domain: :all

    # Custom configurations for this application
    config.x.peferences_session_cookie = :_preferences
    config.x.preference_key_locale = :locale
    config.x.default_locale = :es
  end
end
