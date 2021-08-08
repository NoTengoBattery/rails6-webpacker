module PartiallyValidatable
  def partially_valid?(attributes)
    was_errors = errors.size
    attributes.map(&:to_sym).each do |attribute|
      self.class.validators_on(attribute).each do |validator|
        validator.validate_each(self, attribute, send(attribute))
      end
    end
    errors.size > was_errors
  end
end
