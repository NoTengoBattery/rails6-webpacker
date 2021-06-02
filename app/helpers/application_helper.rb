require "placeholder_helper"

module ApplicationHelper
  def locale_link(name, id, params = {})
    params[:method] = :patch
    link_to name, site_locale_path(id), params
  end
end
