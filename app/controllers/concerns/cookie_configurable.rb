module CookieConfigurable
  extend ActiveSupport::Concern
  # Alright, encoding and decoding this cookie is weird (to say the least). But it leads a nice, tiddy and untamperable
  # cookie without caring about a digest or a signature. In the end, this cookie should not be encryped. It's just some
  # preferences.

  def self.encode(cookie = {}) = CGI.escape(Base64.encode64(Zlib.deflate(cookie.to_bson.to_s)))

  def self.decode(cookie)
    Hash.from_bson(BSON::ByteBuffer.new(Zlib.inflate(Base64.decode64(CGI.unescape(cookie)))))
  rescue StandardError
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
        { value: CookieConfigurable.encode(value), tld_length: AppConfig::Config.cookie_tld_length, domain: :all }
    end
end
