class ApplicationRecord < ActiveRecord::Base
  include PartiallyValidatable

  self.abstract_class = true
end
