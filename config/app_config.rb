module AppConfig
  class Config
    CODE_FRIENDLY_DOMAIN = :website_com
    LOCAL_HOST = :"localhost.localdomain"
    LOCAL_PORT = 3500
    PRODUCTION_HOST = :"website.com"
    PRODUCTION_TLD_LENGHT = 1
    REVIEW = :review
    REVIEW_TLD_LENGTH = 2
    STAGING = :staging
    STAGING_TLD_LENGTH = 2

    IS_PRODUCTION = Rails.env.production?
    IS_REVIEW = IS_PRODUCTION && ENV["IS_HEROKU_REVIEW"]
    IS_STAGING = IS_PRODUCTION && ENV["IS_HEROKU_STAGING"]
    REVIEW_HOST = :"#{REVIEW}.#{self::PRODUCTION_HOST}"
    STAGING_HOST = :"#{STAGING}.#{self::PRODUCTION_HOST}"

    def self.host
      return self::REVIEW_HOST if self::IS_REVIEW
      return self::STAGING_HOST if self::IS_STAGING
      return self::PRODUCTION_HOST if self::IS_PRODUCTION

      LOCAL_HOST
    end

    def self.host_matcher
      hosts_to_match = [host]
      hosts_to_match << LOCAL_HOST
      hosts_to_match << "herokuapp.com"

      hosts_to_match.map do |host|
        /^(?:[[:graph:]]+\.?)*#{Regexp.quote(host)}/
      end
    end

    def self.port
      return nil if self::IS_REVIEW || self::IS_STAGING || self::IS_PRODUCTION

      LOCAL_PORT
    end

    def self.tld_length
      return REVIEW_TLD_LENGTH if self::IS_REVIEW
      return STAGING_TLD_LENGTH if self::IS_STAGING
      return PRODUCTION_TLD_LENGHT if self::IS_PRODUCTION

      1
    end

    def self.cookie_tld_length() = (tld_length + 1).to_s
  end

  class Cookie
    PREFERENCES = :preferences

    def self.cookie_pre
      return AppConfig::Config::REVIEW if AppConfig::Config::IS_REVIEW
      return AppConfig::Config::STAGING if AppConfig::Config::IS_STAGING

      ""
    end

    PREFERENCES_STORE = :"_#{cookie_pre}_#{self::PREFERENCES}"
    SESSION_STORE = :"_#{cookie_pre}_#{AppConfig::Config::CODE_FRIENDLY_DOMAIN}"
  end

  class Locale
    AVAILABLE = %i[en es].freeze
    DEFAULT = :es
    PREFERENCE_KEY = :locale
  end
end
