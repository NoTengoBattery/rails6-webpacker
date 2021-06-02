# Setup the supported locales for the project

rails_config = Rails.application.config.x

I18n.available_locales = %i[en es]
I18n.default_locale = rails_config.default_locale
I18n.locale = rails_config.default_locale
