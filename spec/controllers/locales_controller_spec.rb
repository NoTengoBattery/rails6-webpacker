require "rails_helper"
require "shared_rutines"

RSpec.describe LocalesController, type: :controller do
  include CookieConfigurable
  let(:default) { :es }
  let(:supported) { %i[en en-US es] }
  let(:store) { AppConfig::Cookie::PREFERENCES_STORE }
  let(:locale_key) { AppConfig::Locale::PREFERENCE_KEY }

  describe "#default_locale" do
    before do
      I18n.default_locale = default
      I18n.available_locales = supported
      request.headers["Accept-Language"] = nil
      cookies.delete store
    end

    it "sets the default locale without hints" do
      put :default_locale
      expect(local_preference(locale_key)).to eq(I18n.default_locale)
    end

    it "sets the default locale with broser hints" do
      request.headers["Accept-Language"] = "es;q=1.0"
      put :default_locale
      expect(local_preference(locale_key)).to eq(:es)
    end
  end

  describe "#site_locale" do
    before do
      I18n.default_locale = default
      I18n.available_locales = supported
      cookies.delete store
    end

    it "sets a simple locale from the supported list" do
      patch :site_locale, params: {locale: :es}
      expect(local_preference(locale_key)).to eq(:es)
    end

    it "sets a composed locale from the supported list" do
      patch :site_locale, params: {locale: :"en-US"}
      expect(local_preference(locale_key)).to eq(:"en-US")
    end

    it "sets a simple locale from a partially supported composed locale" do
      patch :site_locale, params: {locale: :"es-GT"}
      expect(local_preference(locale_key)).to eq(:es)
    end

    it "sets a default locale from an unsupported locale" do
      request.headers["Accept-Language"] = nil
      patch :site_locale, params: {locale: :ru}
      expect(local_preference(locale_key)).to eq(I18n.default_locale)
    end

    it "sets a browser-prefered simple locale from an unsupported locale" do
      request.headers["Accept-Language"] = "es;q=1.0"
      patch :site_locale, params: {locale: :ru}
      expect(local_preference(locale_key)).to eq(:es)
    end

    it "sets a browser-prefered composed locale from an unsupported locale" do
      request.headers["Accept-Language"] = "es-GT;q=1.0"
      patch :site_locale, params: {locale: :ru}
      expect(local_preference(locale_key)).to eq(:es)
    end

    it "changes the locale after it's set" do
      patch :site_locale, params: {locale: :"en-US"}
      patch :site_locale, params: {locale: :es}
      expect(local_preference(locale_key)).to eq(:es)
    end
  end
end
