require "localizable"
require "http_authenticable"

class ApplicationController < ActionController::Base
  include Localizable
  include HttpAuthenticable
end
