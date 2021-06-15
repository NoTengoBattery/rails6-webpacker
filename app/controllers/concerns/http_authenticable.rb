# The sole purpose of this concern is to prevent staging/review from being indexed

module HttpAuthenticable
  extend ActiveSupport::Concern

  included { before_action :basic_http_authenticate }

  private
    def basic_http_authenticate
      return unless AppConfig::Config::IS_REVIEW || AppConfig::Config::IS_STAGING

      authenticate_or_request_with_http_basic("Administration") do |username, password|
        Rails.application.credentials.http_basic[:username] == username &&
          Rails.application.credentials.http_basic[:password] == password
      end
    end
end
