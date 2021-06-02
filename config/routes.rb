Rails.application.routes.draw do
  root "placeholders#index"
  patch "locale/:locale", to: "locales#site_locale", as: "site_locale"
  put "locale", to: "locales#default_locale", as: "default_locale"
end
