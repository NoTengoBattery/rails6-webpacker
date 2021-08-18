# The sole purpose of this concern is to prevent staging/review from being indexed

module HttpAuthenticable
  extend ActiveSupport::Concern

  included { before_action :basic_http_authenticate }

  private

  def basic_http_authenticate
    return unless AppConfig::Config::IS_REVIEW || AppConfig::Config::IS_STAGING
    http_credentials = Rails.application.credentials.http_basic

    greeting = I18n.transliterate(I18n.t("misc.http_auth_greeting"))
    authenticate_or_request_with_http_basic(greeting) do |username, password|
      http_credentials[:username] == username && http_credentials[:password] == password
    end
  end
end
