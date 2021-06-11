require "domain_routing"

Rails.application.routes.draw do
  domains_router = DomainsRouter.new(self)

  root "placeholders#index"
  patch "locale/:locale", to: "locales#site_locale", as: "site_locale"
  put "locale", to: "locales#default_locale", as: "default_locale"

  domains_router.subdomain "testing" do
    get "testing_route", to: "placeholders#index"
  end
end
