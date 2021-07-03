module Layouts
  module ApplicationLayoutHelper
    def with_brand(text)
      return nil unless text.is_a?(String)

      "#{text} - #{I18n.t(:site_name)}"
    end
  end
end
