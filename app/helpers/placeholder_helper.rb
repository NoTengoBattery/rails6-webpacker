module PlaceholderHelper
  def mailto_generator
    mail = "from@example.com"
    subject = "[example.com] #{I18n.t :under_construction}"
    body = "[#{I18n.t :message_here}]"
    "mailto:#{mail}?subject=#{subject}&body=#{body}"
  end
end
