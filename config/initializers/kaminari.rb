Kaminari.configure do |config|
  # config.left = 0
  # config.max_pages = nil
  # config.max_per_page = nil
  # config.outer_window = 0
  # config.page_method_name = :page
  # config.param_name = :page
  # config.right = 0
  config.default_per_page = 10
  config.params_on_first_page = true
  config.window = 2
end
