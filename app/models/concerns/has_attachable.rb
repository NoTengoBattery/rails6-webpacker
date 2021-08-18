module HasAttachable
  def attachment_valid?(att, types, size, name)
    return unless check_presence(att, name)

    check_size(att, size, name)
    check_format(att, types, name)
  end

  private

  def check_presence(att, name)
    errors.add(name, I18n.t("errors.messages.blank")) unless att.attached?
    att.attached?
  end

  def check_size(att, size, name)
    errors.add(name, I18n.t("errors.messages.oversize", size: "#{size} bytes")) unless att.byte_size <= size
  end

  def check_format(att, types, name)
    return if types.include?(att.content_type)

    errors.add(name, I18n.t("errors.messages.format", formats: types.join(", ")))
  end
end
