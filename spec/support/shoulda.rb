require "shoulda-matchers"

RSpec.configure do |_config|
  Shoulda::Matchers.configure do |config_shoulda|
    config_shoulda.integrate do |with|
      with.test_framework :rspec
      with.library :rails
    end
  end
end
