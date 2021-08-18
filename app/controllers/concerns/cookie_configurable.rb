module CookieConfigurable
  extend ActiveSupport::Concern

  def self.encode(cookie = {})
    Rails.cache.fetch(CacheKey.gen!(cookie)) do
      Base64.urlsafe_encode64(Zlib.deflate(cookie.to_bson.to_s), padding: false)
    end
  end

  def self.decode(cookie)
    Rails.cache.fetch(CacheKey.gen!(cookie)) do
      Hash.from_bson(BSON::ByteBuffer.new(Zlib.inflate(Base64.urlsafe_decode64(cookie))))
    end
  rescue
    {}
  end

  private

  def local_preference=(params)
    return if params[:key].nil?

    current_prefs = __prefs
    current_prefs[params[:key].to_s] = params[:value]
    self.__prefs = current_prefs
  end

  def local_preference(key) = __prefs.[](key.to_s)&.to_sym

  def __pref_cookie() = AppConfig::Cookie::PREFERENCES_STORE

  def __prefs = CookieConfigurable.decode(cookies.permanent[__pref_cookie])

  def __prefs=(value)
    cookies.permanent[__pref_cookie] =
      {value: CookieConfigurable.encode(value), tld_length: AppConfig::Config.cookie_tld_length, domain: :all}
  end
end
