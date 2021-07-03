ActionView::Base.field_error_proc = proc do |html_tag, _instance|
  fragment = Nokogiri::HTML.fragment(html_tag)
  input_tag = fragment.at_css(:input)

  if input_tag
    new_class = input_tag[:class].split.append("invalid")
    input_tag[:class] = new_class.join(" ")
  end
  ActiveSupport::SafeBuffer.new(fragment.to_html)
end
