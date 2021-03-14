class ApplicationController < ActionController::Base
  before_action :configure_locale

  private
    def configure_locale(locale = filter_locale(cookies.permanent[:locale]))
      accept_languages = request.headers["Accept-Language"] || ""
      browser_locale = filter_locale(HTTP::Accept::Languages.parse(accept_languages).first&.locale)
      prefered_locale = locale || browser_locale || I18n.default_locale
      I18n.locale = cookies.permanent[:locale] = prefered_locale
    end

    def filter_locale(locale)
      return nil if locale.nil?
      if I18n.available_locales.include?(locale.to_sym)
        locale.to_sym
      else
        locale = locale.to_s.downcase
        language = locale.split("-", 2).first
        I18n.available_locales.include?(language.to_sym) ? language.to_sym : nil
      end
    end
end
