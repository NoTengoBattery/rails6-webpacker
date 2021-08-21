source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "~> 3.0"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem "rails", "~> 6.1", ">= 6.1.4"
# Use Puma as the app server
gem "puma", "~> 5.4"
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem "webpacker", "6.0.0.rc.1"
# Turbo makes navigating your web application faster.
gem "turbo-rails", "~> 0.7"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.11", ">= 2.11.2"
# Use Redis adapter to run Action Cable in production
gem "hiredis", "~> 0.6"
gem "redis", "~> 4.4", require: ["redis", "redis/connection/hiredis"]

# Extra gems required for this project
gem "aws-sdk-s3", "~> 1.99", require: false
gem "bson", "~> 4.12", ">= 4.12.1"
gem "devise", "~> 4.8"
gem "devise-i18n", "~> 1.10"
gem "hamlit-rails", "~> 0.2"
gem "image_processing", "~> 1.12", ">= 1.12.1"
gem "irb", "~> 1.3", ">= 1.3.7"
gem "kaminari", "~> 1.2", ">= 1.2.1"
gem "pg", "~> 1.2", ">= 1.2.3"
gem "rails-i18n", "~> 6.0"
gem "resque", "~> 2.1"
gem "rest-client", "~> 2.1"

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", "~> 1.7", ">= 1.7.7", require: false

# Display performance information such as SQL time and flame graphs for each request in your browser.
# Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
gem "rack-mini-profiler", "~> 2.3", ">= 2.3.2", require: false

group :development, :test do
  gem "annotate", "~> 3.1", ">= 3.1.1"
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  # Add this to both development and test to take advantage of the generators
  gem "factory_bot_rails", "~> 6.2"
  gem "faker", "~> 2.18"
  gem "rspec-rails", "~> 5.0", ">= 5.0.2"
  # Helper to avoid N+1 and unused eager loads
  gem "bullet", "~> 6.1", ">= 6.1.4"
end

group :development do
  gem "listen", "~> 3.7"
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem "web-console", "~> 4.1"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring", "~> 2.1", ">= 2.1.1"
  # Rubocop linter gems for linting the source code during development
  gem "rubocop-faker", "~> 1.1", require: false
  gem "rubocop-i18n", "~> 3.0", require: false
  gem "rubocop-rails_config", "~> 1.6", require: false
  gem "rubocop-rake", "~> 0.6", require: false
  gem "rubocop-rspec", "~> 2.4", require: false
  gem "standard", "~> 1.1", ">= 1.1.7", require: false
  # This gem makes internationalization easier
  gem "i18n-tasks", "~> 0.9", require: false
  # Gems for improving development quality
  gem "haml_lint", "~> 0.37", require: false
  gem "solargraph", "~> 0.43", require: false
end

group :test do
  gem "rexml", "~> 3.2", ">= 3.2.5", require: false
  # Adds support for Capybara testing and the Selenium Web Driver
  gem "capybara", "~> 3.35", ">= 3.35.3"
  gem "database_cleaner", "~> 2.0", ">= 2.0.1"
  gem "selenium-webdriver"
  gem "webdrivers"
  # Gems to support testing better
  gem "shoulda-matchers", "~> 5.0"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
