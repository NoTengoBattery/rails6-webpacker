require "capybara/rspec"

RSpec.configure do |config|
  config.use_transactional_fixtures = false

  config.before(:suite) do
    if config.use_transactional_fixtures?
      raise(<<-MSG)
        Delete line `config.use_transactional_fixtures = true` from rails_helper.rb
        (or set it to false) to prevent uncommitted transactions being used in
        JavaScript-dependent specs.

        During testing, the app-under-test that the browser driver connects to
        uses a different database connection to the database connection used by
        the spec. The app's database connection would not be able to access
        uncommitted transaction data setup over the spec's database connection.
      MSG
    end

    DatabaseCleaner.clean_with(:truncation)
  end

  config.before do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, type: :feature) do
    # :rack_test driver's Rack app under test shares database connection
    # with the specs, so continue to use transaction strategy for speed.
    driver_shares_db_connection_with_specs = Capybara.current_driver == :rack_test

    unless driver_shares_db_connection_with_specs
      # Driver is probably for an external browser with an app
      # under test that does *not* share a database connection with the
      # specs, so use truncation strategy.
      DatabaseCleaner.strategy = :truncation
    end
  end

  config.before do
    DatabaseCleaner.start
  end

  config.append_after do
    DatabaseCleaner.clean
  end

  # Change the default driver to Selenium Headless
  config.before(:each, type: :system) do
    using_browser = (ENV["USING_BROWSER"] || "chrome").try(:to_sym)
    driver = ENV["CI"] ? :selenium_headless : :selenium
    driven_by driver, using: using_browser

    # This code will seed the lax-domain cookie that stores the site preferences
    manage = page.driver.browser.manage
    config_hash = {
      AppConfig::Locale::PREFERENCE_KEY => I18n.with_locale { AppConfig::Locale::DEFAULT }
    }
    visit root_path
    manage.delete_all_cookies
    manage.add_cookie(name: AppConfig::Cookie::PREFERENCES_STORE, value: CookieConfigurable.encode(config_hash))
  end

  # Set the capybara host URL to the same as the Action Mailer default host
  Capybara.server_host = AppConfig::Config.host.to_s
  Capybara.server_port = AppConfig::Config.port.to_s if AppConfig::Config.port
end
