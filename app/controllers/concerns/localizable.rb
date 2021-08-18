require "cookie_configurable"

module Localizable
  include CookieConfigurable
  extend ActiveSupport::Concern

  included { before_action :configure_locale }

  private

  def __locale_key() = AppConfig::Locale::PREFERENCE_KEY

  def cookie_locale() = local_preference(__locale_key)&.to_sym

  def cookie_locale=(locale)
    self.local_preference = {key: __locale_key, value: locale}
  end

  def i18n_locale=(locale)
    I18n.locale = self.cookie_locale = locale
  end

  def filter_locale(locale)
    return nil if locale.nil?

    language = locale.to_s.split("-", 2).first&.to_sym
    locale = locale.to_sym
    if I18n.available_locales.include?(locale)
      locale
    else
      (I18n.available_locales.include?(language) ? language : nil)
    end
  end

  def infer_locale
    browser = filter_locale(HTTP::Accept::Languages.parse(request.accept_language || "").first&.locale)
    self.i18n_locale = (browser || I18n.default_locale)
  end

  def configure_locale(config = {})
    self.cookie_locale = filter_locale(config[:new]) if config[:new]
    self.i18n_locale = filter_locale(cookie_locale)
    infer_locale unless cookie_locale
  end
end
