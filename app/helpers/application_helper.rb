require "layouts/application_layout_helper"
require "placeholder_helper"

module ApplicationHelper
  include Layouts::ApplicationLayoutHelper

  def locale_link(name, id, params = {})
    params[:method] = :patch
    button_to name, site_locale_path(id), params
  end
end
