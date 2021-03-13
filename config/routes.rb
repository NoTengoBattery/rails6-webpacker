Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  patch "locale/:locale", to: "locales#site_locale", as: "site_locale"
end
