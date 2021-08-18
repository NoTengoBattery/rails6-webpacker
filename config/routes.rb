require "domain_routing"

Rails.application.routes.draw do
  domains_router = DomainsRouter.new(self)

  root "placeholders#index"
  patch "/locale/:locale", action: :site_locale, controller: :locales, as: :site_locale
  put "/locale", action: :default_locale, controller: :locales, as: :default_locale

  domains_router.subdomain :testing do
    get "/testing_route", action: :index, controller: :placeholders
  end
end
