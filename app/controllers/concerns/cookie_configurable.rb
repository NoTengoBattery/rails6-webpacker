module CookieConfigurable
  extend ActiveSupport::Concern

  private
    def __pref_cookie() = Rails.application.config.x.peferences_session_cookie

    def __prefs = JSON.parse(cookies.permanent[__pref_cookie] || "{}")

    def __prefs=(value)
      cookies.permanent[__pref_cookie] = { value: JSON.generate(value), domain: :all }
    end

    def local_preference=(params)
      current_prefs = __prefs
      current_prefs[params[:key].to_s] = params[:value]
      self.__prefs = current_prefs
    end

    def local_preference(key)
      __prefs[key.to_s]
    end
end
