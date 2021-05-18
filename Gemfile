source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "~> 3.0"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem "rails", "~> 6.1", ">= 6.1.3"
# Use Puma as the app server
gem "puma", "~> 5.3"
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem "webpacker", "6.0.0.beta.7", ">= 6.0.0.beta.6"
# Turbo makes navigating your web application faster.
gem "turbo-rails", "~> 0.5"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.11", ">= 2.11.2"
# Use Redis adapter to run Action Cable in production
gem "hiredis", "~> 0.6"
gem "redis", "~> 4.2", ">= 4.2.5", require: ["redis", "redis/connection/hiredis"]
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1', '>= 3.1.16'

# Extra gems required for this project
gem "annotate", "~> 3.1"
gem "devise", "~> 4.7", ">= 4.7.3"
gem "devise-i18n", "~> 1.9", ">= 1.9.2"
gem "irb", "~> 1.3", ">= 1.3.5"
gem "haml", "~> 5.2", ">= 5.2.1"
gem "image_processing", "~> 1.12", ">= 1.12.1"
gem "kaminari", "~> 1.2", ">= 1.2.1"
gem "rails-i18n", "~> 6.0"
gem "rest-client", "~> 2.1"

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", "~> 1.7", ">= 1.7.2", require: false

group :production do
  # Use postgresql for the production database
  gem "pg", "~> 1.2", ">= 1.2.3"
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  # Add the SQLite3 database for development and test
  gem "sqlite3", "~> 1.4", ">= 1.4.2"
  # Add this to both development and test to take advantage of the generators
  gem "factory_bot_rails", "~> 6.1"
  gem "faker", "~> 2.16"
  gem "rspec-rails", "~> 4.0", ">= 4.0.2"
  # Helper to avoid N+1 and unused eager loads
  gem "bullet", "~> 6.1", ">= 6.1.4"
  # Language server for Ruby (useful with the VSC extension)
  gem "solargraph", "~> 0.40"
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem "web-console", "~> 4.1"
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem "listen", "~> 3.4", ">= 3.4.1"
  gem "rack-mini-profiler", "~> 2.3", ">= 2.3.1"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring", "~> 2.1", ">= 2.1.1"
  # Rubocop linter gems for linting the source code during development
  gem "rubocop-faker", "~> 1.1"
  gem "rubocop-i18n", "~> 3.0"
  gem "rubocop-rails_config", "~> 1.3", ">= 1.3.3"
  gem "rubocop-rake", "~> 0.5"
  gem "rubocop-rspec", "~> 2.2"
  # This gem makes internationalization easier
  gem "i18n-tasks", "~> 0.9"
  # Use mina for deploying Puma applications
  gem "mina", "~> 1.2", ">= 1.2.3"
  gem "mina-systemd", github: "NoTengoBattery/mina-systemd"
end

group :test do
  # Adds support for Capybara testing and the Selenium Web Driver
  gem "capybara", ">= 3.26"
  gem "database_cleaner", "~> 2.0", ">= 2.0.1"
  gem "selenium-webdriver", "~> 3.142", ">= 3.142.7"
  gem "webdrivers", "~> 4.6"
  # Gems to support testing better
  gem "rails-controller-testing", "~> 1.0", ">= 1.0.5"
  gem "rexml", "~> 3.2", ">= 3.2.4"
  gem "shoulda-matchers", "~> 4.5", ">= 4.5.1"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
