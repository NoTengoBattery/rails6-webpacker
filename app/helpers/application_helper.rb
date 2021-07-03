require "layouts/application_layout_helper"
require "placeholder_helper"

module ApplicationHelper
  def resource_attribute_name(res, name, kase = :humanize)
    res.class.human_attribute_name(name).send(kase)
  end

  def locale_link(name, id, params = {})
    params[:method] = :patch
    button_to name, site_locale_path(id), params
  end

  def dom_uuid(*thing)
    Rails.cache.fetch(CacheKey.gen!(thing)) do
      "I#{Base64.urlsafe_encode64(Digest::MD5.digest(Marshal.dump(thing)), padding: false)}"
    end
  end
end
