require "rails_helper"
require "shared_rutines"

RSpec.describe LocalesController, type: :controller do
  include Localizable

  describe "#default_locale" do
    before do
      I18n.default_locale = :en
      I18n.available_locales = %i[en en-US es]
      self.cookie_locale = nil
      request.headers["Accept-Language"] = nil
    end

    it "sets the default locale without hints" do
      put :default_locale
      expect(cookie_locale).to eq(I18n.default_locale)
    end

    it "sets the default locale with broser hints" do
      request.headers["Accept-Language"] = "es;q=1.0"
      put :default_locale
      expect(cookie_locale).to eq(:es)
    end
  end

  describe "#site_locale" do
    before do
      I18n.default_locale = :en
      I18n.available_locales = %i[en en-US es]
      self.cookie_locale = nil
    end

    it "sets a simple locale from the supported list" do
      patch :site_locale, params: { locale: :es }
      expect(cookie_locale).to eq(:es)
    end

    it "sets a composed locale from the supported list" do
      patch :site_locale, params: { locale: :"en-US" }
      expect(cookie_locale).to eq(:"en-US")
    end

    it "sets a simple locale from a partially supported composed locale" do
      patch :site_locale, params: { locale: :"es-GT" }
      expect(cookie_locale).to eq(:es)
    end

    it "sets a default locale from an unsupported locale" do
      request.headers["Accept-Language"] = nil
      patch :site_locale, params: { locale: :ru }
      expect(cookie_locale).to eq(I18n.default_locale)
    end

    it "sets a browser-prefered simple locale from an unsupported locale" do
      request.headers["Accept-Language"] = "es;q=1.0"
      patch :site_locale, params: { locale: :ru }
      expect(cookie_locale).to eq(:es)
    end

    it "sets a browser-prefered composed locale from an unsupported locale" do
      request.headers["Accept-Language"] = "es-GT;q=1.0"
      patch :site_locale, params: { locale: :ru }
      expect(cookie_locale).to eq(:es)
    end

    it "changes the locale after it's set" do
      patch :site_locale, params: { locale: :"en-US" }
      patch :site_locale, params: { locale: :es }
      expect(cookie_locale).to eq(:es)
    end
  end
end
