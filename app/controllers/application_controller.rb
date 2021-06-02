require "localizable"

class ApplicationController < ActionController::Base
  include Localizable

  before_action :configure_locale
end
