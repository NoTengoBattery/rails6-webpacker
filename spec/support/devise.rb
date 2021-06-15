require "devise"

RSpec.configure do |config|
  config.include Devise::Test::IntegrationHelpers, type: :controller
  config.include Devise::Test::IntegrationHelpers, type: :feature
  config.include Devise::Test::IntegrationHelpers, type: :helper
  config.include Devise::Test::IntegrationHelpers, type: :model
  config.include Devise::Test::IntegrationHelpers, type: :request
  config.include Devise::Test::IntegrationHelpers, type: :routing
  config.include Devise::Test::IntegrationHelpers, type: :view
end
